# My Point - Документация Проекта

## Содержание
1. [Архитектура проекта](#архитектура-проекта)
2. [Сетевой слой (Dio)](#сетевой-слой-dio)
3. [Навигация (Go Router)](#навигация-go-router)
4. [Dependency Injection (Injectable)](#dependency-injection)
5. [Features](#features)
6. [Структура проекта](#структура-проекта)

---

## Архитектура проекта

Проект построен на **Clean Architecture** с разделением на слои:

### Слои архитектуры
```
lib/
├── src/
│   ├── app/                    # Конфигурация приложения
│   ├── core/                   # Ядро приложения
│   │   ├── api/               # API клиенты
│   │   ├── router/            # Навигация
│   │   ├── services/          # Сервисы (DI, Storage, Auth)
│   │   ├── theme/             # Темы и стили
│   │   └── exceptions/        # Обработка ошибок
│   └── features/              # Функциональные модули
│       ├── scan/              # QR сканирование
│       ├── auth/              # Авторизация
│       ├── register/          # Регистрация
│       ├── home/              # Главная
│       ├── delivery/          # Доставка
│       ├── order/             # Заказы
│       └── profile/           # Профиль
```

### Принципы
- **Feature-first organization**: Каждая фича - отдельный модуль
- **Clean Architecture**: Разделение на presentation, domain, data
- **Dependency Injection**: Injectable/GetIt для управления зависимостями
- **Functional Programming**: FPDart для обработки Either<Error, Success>

---

## Сетевой слой (Dio)

### Конфигурация DioRestClient

**Файл**: `lib/src/core/api/client/rest/dio/dio_client.dart`

```dart
@Singleton()
class DioRestClient {
  late final Dio _dio;
  
  @PostConstruct(preResolve: true)
  Future<void> init() async {
    BaseOptions options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: DioConfigurations.connectTimeout,
      receiveTimeout: DioConfigurations.receiveTimeout,
    );
    _dio.options = options;
    
    // Логирование запросов (curl)
    _dio.interceptors.add(CurlLoggerInterceptor());
    
    // Перехватчик для авторизации и refresh token
    _dio.interceptors.add(DioInterceptor(dio: _dio));
  }
}
```

### Основные методы

#### GET запрос
```dart
Future<Either<DomainException, Response>> get(
  String url, {
  Map<String, dynamic>? queryParameters,
  Options? options,
}) async {
  try {
    final Response response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return Right(response);
  } on DioException catch (e, s) {
    if (e.response?.statusCode == 401) {
      return Left(AuthenticationException.invalidCredentials());
    }
    return Left(_handleDioException(e, s));
  }
}
```

#### POST запрос
```dart
Future<Either<DomainException, Response>> post(
  String url, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
}) async {
  try {
    final Response response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );
    return Right(response);
  } on DioException catch (e, s) {
    return Left(_handleDioException(e, s));
  }
}
```

### Interceptors

#### DioInterceptor - Авторизация и Refresh Token

**Функции**:
1. **Автоматическое добавление токена**: Добавляет `Authorization: Bearer <token>` в каждый запрос
2. **Refresh token при 401**: Автоматически обновляет токен при истечении
3. **Очередь запросов**: Ставит запросы в очередь во время обновления токена

```dart
class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? accessToken = st.getToken();
    
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    
    return handler.next(options);
  }
  
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }
    
    // Обновляем токен и повторяем запрос
    final token = await _refreshTokenAndGetNew(err.requestOptions);
    if (token != null) {
      final response = await _retryRequest(err.requestOptions, token);
      return handler.resolve(response);
    }
    
    await _handleRefreshFailure(handler, err);
  }
}
```

#### CurlLoggerInterceptor - Логирование

Логирует все запросы в формате curl для отладки:

```bash
curl -X POST \
  -H "Authorization: Bearer token..." \
  -H "Content-Type: application/json" \
  -d '{"key": "value"}' \
  https://api.example.com/endpoint
```

### Обработка ошибок

**Файл**: `lib/src/core/api/client/rest/dio/dio_exceptions.dart`

```dart
DomainException _handleDioException(DioException e, StackTrace s) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return NetworkException.requestTimeout();
    case DioExceptionType.receiveTimeout:
      return NetworkException.receiveTimeout();
    case DioExceptionType.badResponse:
      return _handleStatusCode(e.response?.statusCode);
    case DioExceptionType.connectionError:
      return NetworkException.noInternetConnection();
    default:
      return UnknownException();
  }
}
```

### Endpoints

**Файл**: `lib/src/core/api/client/rest/endpoints.dart`

```dart
class EndPoints {
  static const String baseUrl = 'https://api.example.com';
  
  // Auth endpoints
  static const String login = '/auth/login';
  static const String refresh = '/auth/refresh';
  static const String logout = '/auth/logout';
  
  // User endpoints
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/update';
}
```

---

## Навигация (Go Router)

### Конфигурация Router

**Файл**: `lib/src/core/router/router.dart`

```dart
GoRouter createRouter() {
  final StorageServiceImpl st = StorageServiceImpl();
  final String? token = st.getToken();
  final bool hasSeenIntroduction = st.hasSeenIntroduction();
  
  return GoRouter(
    refreshListenable: st,
    initialLocation: RoutePaths.home,
    debugLogDiagnostics: true,
    routes: _routes,
  );
}
```

### Пути навигации

**Файл**: `lib/src/core/router/router_paths.dart`

```dart
class RoutePaths {
  static const String initial = '/';
  static const String loading = '/loading';
  static const String home = '/home';
  static const String delivery = '/delivery';
  static const String order = '/order';
  static const String profile = '/profile';
  static const String scan = '/scan';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String introduction = '/introduction';
  static const String unregisteredUser = '/unregistered-user';
  static const String successRegister = '/success-register';
}
```

### StatefulShellRoute - Bottom Navigation

**Файл**: `lib/src/core/router/route_list.dart`

```dart
final List<RouteBase> _routes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return AppNavigationWrapper(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        child: navigationShell,
      );
    },
    branches: [
      // Tab 0 - Home
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePaths.home,
            pageBuilder: (context, state) => getPage(
              child: HomePage(), 
              state: state
            ),
          ),
        ],
      ),
      // Tab 1 - Delivery
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePaths.delivery,
            pageBuilder: (context, state) => getPage(
              child: DeliveryPage(), 
              state: state
            ),
          ),
        ],
      ),
      // Tab 2 - Orders
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePaths.order,
            pageBuilder: (context, state) => getPage(
              child: OrderPage(), 
              state: state
            ),
          ),
        ],
      ),
      // Tab 3 - Profile
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePaths.profile,
            pageBuilder: (context, state) => getPage(
              child: ProfilePage(), 
              state: state
            ),
          ),
        ],
      ),
      // Tab 4 - Scan
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePaths.scan,
            pageBuilder: (context, state) => getPage(
              child: ScanPage(), 
              state: state
            ),
          ),
        ],
      ),
    ],
  ),
  
  // Standalone routes
  GoRoute(
    path: RoutePaths.login,
    pageBuilder: (context, state) => getPage(
      child: const LoginPage(), 
      state: state
    ),
  ),
  
  GoRoute(
    path: RoutePaths.otp,
    pageBuilder: (context, state) {
      final data = state.extra as Map<String, dynamic>;
      return getPage(
        child: OtpPage(phone: data['phone']),
        state: state,
      );
    }
  ),
];
```

### Навигация в коде

#### Переход на страницу
```dart
// Простой переход
context.go(RoutePaths.home);

// Переход с параметрами
context.go(RoutePaths.otp, extra: {'phone': '+7 777 123 45 67'});

// Push (с возможностью вернуться назад)
context.push(RoutePaths.login);

// Replace (заменить текущий экран)
context.replace(RoutePaths.home);
```

#### Возврат назад
```dart
// Назад на предыдущий экран
context.pop();

// Назад с результатом
context.pop(result);
```

#### Переключение табов
```dart
// В AppNavigationWrapper
navigationShell.goBranch(index);
```

---

## Dependency Injection

### Injectable Setup

**Файл**: `lib/src/core/services/injectable/injectable_service.dart`

```dart
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);
```

### Регистрация зависимостей

#### Singleton
```dart
@Singleton()
class DioRestClient {
  // ...
}
```

#### LazySingleton
```dart
@lazySingleton
class AuthServiceImpl implements IAuthService {
  final DioRestClient _client;
  
  AuthServiceImpl(this._client);
  // ...
}
```

#### Factory
```dart
@injectable
class AuthorizationBloc extends Bloc<AuthEvent, AuthState> {
  // Создается новый экземпляр при каждом запросе
}
```

### Использование GetIt

```dart
// Получение зависимости
final authService = getIt<IAuthService>();

// С именем
final authService = getIt<IAuthService>(
  instanceName: 'AuthServiceImpl'
);
```

---

## Features

### 1. Scan (QR Сканирование)

#### Структура
```
lib/src/features/scan/
├── presentation/
│   ├── page/
│   │   └── scan_page.dart              # Главная страница сканера
│   ├── components/
│   │   └── qr_scanner_widget.dart      # Виджет QR сканера
│   └── services/
│       └── permission_service.dart      # Запрос разрешений
```

#### scan_page.dart
```dart
class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: PermissionService.requestCameraPermission(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return QRScannerWidget(
              onQRCodeDetected: (code) {
                // Обработка отсканированного QR кода
                print('QR Code: $code');
                context.pop();
              },
              onClose: () => context.pop(),
            );
          }
          return PermissionDeniedWidget();
        },
      ),
    );
  }
}
```

#### qr_scanner_widget.dart

**Основные компоненты**:

1. **MobileScannerController**: Управление камерой
```dart
MobileScannerController initController() => MobileScannerController(
  autoStart: false,
  cameraResolution: Size(1920, 1080),
  detectionSpeed: DetectionSpeed.unrestricted,
  formats: [], // Все форматы
  torchEnabled: false,
  autoZoom: false,
);
```

2. **MobileScanner Widget**: Отображение камеры
```dart
MobileScanner(
  tapToFocus: true,
  controller: controller,
  onDetect: _onDetect,
  fit: BoxFit.contain,
)
```

3. **Dotted Border Overlay**: Визуализация области сканирования
```dart
_buildDottedBorderOverlay() {
  return IgnorePointer(
    child: Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(16),
            dashPattern: [100, 50],
            strokeWidth: 6,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
```

4. **Обработка сканирования**:
```dart
void _onDetect(BarcodeCapture capture) {
  if (!_hasScanned && capture.barcodes.isNotEmpty) {
    final String? code = capture.barcodes.first.rawValue;
    if (code != null) {
      setState(() => _hasScanned = true);
      widget.onQRCodeDetected(code);
    }
  }
}
```

#### permission_service.dart
```dart
class PermissionService {
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }
  
  static Future<bool> checkCameraPermission() async {
    return await Permission.camera.isGranted;
  }
}
```

### 2. Auth (Авторизация)

#### Структура
```
lib/src/features/auth/
├── presentation/
│   ├── pages/
│   │   ├── login_page.dart
│   │   └── otp_page.dart
│   └── bloc/
│       └── authorization_bloc.dart
├── domain/
│   ├── entities/
│   │   └── user.dart
│   └── repositories/
│       └── auth_repository.dart
└── data/
    ├── models/
    │   ├── login_request.dart
    │   └── login_response.dart
    └── repositories/
        └── auth_repository_impl.dart
```

#### AuthService
```dart
@lazySingleton
class AuthServiceImpl implements IAuthService {
  final DioRestClient _client;
  
  AuthServiceImpl(this._client);
  
  Future<Either<DomainException, LoginResponse>> login({
    required String phone,
    required String password,
  }) async {
    final result = await _client.post(
      EndPoints.login,
      data: {
        'phone': phone,
        'password': password,
      },
    );
    
    return result.fold(
      (error) => Left(error),
      (response) {
        final loginResponse = LoginResponse.fromJson(response.data);
        // Сохранение токена
        st.setToken(loginResponse.accessToken);
        return Right(loginResponse);
      },
    );
  }
  
  Future<Either<DomainException, void>> logout() async {
    final result = await _client.post(EndPoints.logout);
    return result.fold(
      (error) => Left(error),
      (_) {
        st.clearToken();
        return const Right(null);
      },
    );
  }
}
```

#### AuthorizationBloc
```dart
@injectable
class AuthorizationBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService _authService;
  
  AuthorizationBloc(this._authService) : super(AuthState.initial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }
  
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    
    final result = await _authService.login(
      phone: event.phone,
      password: event.password,
    );
    
    result.fold(
      (error) => emit(state.copyWith(
        isLoading: false,
        error: error.message,
      )),
      (response) => emit(state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        user: response.user,
      )),
    );
  }
}
```

### 3. Register (Регистрация)

#### Структура
```
lib/src/features/register/
├── presentation/
│   ├── pages/
│   │   ├── unregistered_user_view.dart
│   │   └── success_register_page.dart
│   ├── components/
│   │   └── register_picture_place_holder_widget.dart
│   └── bloc/
│       └── register_pvz_bloc.dart
```

### 4. Home (Главная)

#### Структура
```
lib/src/features/home/
├── presentation/
│   ├── pages/
│   │   └── home_page.dart
│   └── widgets/
│       ├── home_header.dart
│       └── home_content.dart
```

### 5. Delivery (Доставка)

#### Структура
```
lib/src/features/delivery/
├── presentation/
│   ├── pages/
│   │   └── delivery_page.dart
│   └── widgets/
│       └── delivery_list.dart
```

### 6. Order (Заказы)

#### Структура
```
lib/src/features/order/
├── presentation/
│   ├── pages/
│   │   └── order_page.dart
│   └── widgets/
│       └── order_list.dart
```

### 7. Profile (Профиль)

#### Структура
```
lib/src/features/profile/
├── presentation/
│   ├── pages/
│   │   └── profile_page.dart
│   └── widgets/
│       └── profile_info.dart
```

---

## Структура проекта

### Полная структура
```
my_point/
├── android/                    # Android нативный код
├── ios/                        # iOS нативный код
├── lib/
│   ├── firebase_options.dart   # Firebase конфигурация
│   ├── gen/                    # Сгенерированные файлы
│   ├── main.dart              # Entry point
│   ├── main_dev.dart          # Dev entry point
│   ├── main_prod.dart         # Production entry point
│   ├── main_staging.dart      # Staging entry point
│   └── src/
│       ├── app/
│       │   ├── application.dart              # MaterialApp setup
│       │   ├── app_navigation_wrapper.dart   # Bottom navigation
│       │   └── flavor_builds.dart            # Flavor configuration
│       ├── core/
│       │   ├── api/
│       │   │   └── client/rest/dio/
│       │   │       ├── dio_client.dart
│       │   │       ├── dio_config.dart
│       │   │       ├── dio_interceptor.dart
│       │   │       ├── dio_exceptions.dart
│       │   │       └── curl_logger_interceptor.dart
│       │   ├── router/
│       │   │   ├── router.dart
│       │   │   ├── router_paths.dart
│       │   │   ├── router_names.dart
│       │   │   └── route_list.dart
│       │   ├── services/
│       │   │   ├── injectable/
│       │   │   │   ├── injectable_service.dart
│       │   │   │   └── injectable_service.config.dart
│       │   │   ├── storage/
│       │   │   │   └── storage_service_impl.dart
│       │   │   ├── auth/
│       │   │   │   ├── auth_service.dart
│       │   │   │   └── auth_service_impl.dart
│       │   │   └── firebase/
│       │   │       └── firebase_manager.dart
│       │   ├── theme/
│       │   │   ├── theme.dart
│       │   │   ├── colors.dart
│       │   │   └── typography.dart
│       │   ├── extensions/
│       │   │   └── build_context_extension.dart
│       │   └── exceptions/
│       │       └── domain_exception.dart
│       └── features/
│           ├── scan/
│           ├── auth/
│           ├── register/
│           ├── home/
│           ├── delivery/
│           ├── order/
│           └── profile/
├── assets/
│   ├── app_images/
│   ├── fonts/
│   └── icons/
├── pubspec.yaml
└── README.md
```

---

## Основные библиотеки

### Сеть и API
- **dio**: ^5.4.0 - HTTP клиент
- **fpdart**: ^1.1.0 - Functional programming (Either)

### Навигация
- **go_router**: ^13.0.0 - Декларативная навигация

### Dependency Injection
- **injectable**: ^2.3.2 - Code generation для DI
- **get_it**: ^7.6.4 - Service locator

### State Management
- **flutter_bloc**: ^8.1.3 - BLoC pattern

### Storage
- **shared_preferences**: ^2.2.2 - Локальное хранилище
- **flutter_secure_storage**: ^9.0.0 - Безопасное хранилище

### QR Scanner
- **mobile_scanner**: ^7.1.2 - QR/Barcode сканирование
- **dotted_border**: ^2.1.0 - Пунктирные границы
- **permission_handler**: ^11.2.0 - Разрешения

### Firebase
- **firebase_core**: ^2.24.2
- **firebase_messaging**: ^14.7.10
- **firebase_analytics**: ^10.8.0

### UI
- **flutter_svg**: ^2.0.9 - SVG изображения
- **cached_network_image**: ^3.3.1 - Кеширование изображений

---

## Запуск проекта

### Development
```bash
flutter run -t lib/main_dev.dart --flavor development
```

### Staging
```bash
flutter run -t lib/main_staging.dart --flavor staging
```

### Production
```bash
flutter run -t lib/main_prod.dart --flavor production
```

### Генерация кода
```bash
# Injectable
flutter pub run build_runner build --delete-conflicting-outputs

# Translations
flutter gen-l10n
```

---

## Best Practices

### 1. Работа с Dio
- Всегда возвращайте `Either<DomainException, T>`
- Обрабатывайте ошибки централизованно
- Используйте interceptors для общей логики

### 2. Навигация
- Используйте константы из `RoutePaths`
- Передавайте данные через `extra`
- Избегайте прямых ссылок на `context` вне виджетов

### 3. State Management
- Один BLoC на один экран
- События должны быть иммутабельными
- Используйте `copyWith` для обновления состояния

### 4. Dependency Injection
- Используйте `@injectable` для автоматической регистрации
- Инжектируйте через конструктор
- Избегайте прямых вызовов `getIt` в виджетах

### 5. Feature Organization
- Каждая фича - отдельный модуль
- Следуйте Clean Architecture
- presentation → domain → data

---

## Troubleshooting

### Проблема: Токен не добавляется в запросы
**Решение**: Проверьте, что токен сохранен в StorageService и DioInterceptor правильно его извлекает

### Проблема: Навигация не работает
**Решение**: Убедитесь, что путь зарегистрирован в `route_list.dart`

### Проблема: Dependency не найдена
**Решение**: Запустите `flutter pub run build_runner build`

### Проблема: QR сканер не работает
**Решение**: 
1. Проверьте разрешения в AndroidManifest.xml и Info.plist
2. Убедитесь, что запрос разрешений выполнен
3. Проверьте, что контроллер инициализирован

---

## Контакты и поддержка

Для вопросов и поддержки:
- Email: support@mypoint.kz
- Telegram: @mypoint_support

