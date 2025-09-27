# My Point - Руководство по разработке

## Содержание
- [Общий флоу разработки](#общий-флоу-разработки)
- [Code Style](#code-style)
- [Git Flow](#git-flow)
- [Архитектура](#архитектура)

---

## Общий флоу разработки
 
### Требования к окружению
- Flutter SDK (версия 3.5.3+)
- Dart SDK (версия 3.5.3+)
- Android Studio / VS Code
- iOS development tools (для Mac пользователей)
- Git

### Процесс разработки

#### 1. Начало работы с проектом
```bash
# Клонирование репозитория
git clone git@gitlab.com:green-eye-ltd/jet-join/mobile/mobile.git

# Установка зависимостей
flutter pub get

# Генерация кода (Freezed, Injectable, etc.)
dart run build_runner build

# Запуск приложения
flutter run --flavor dev --target lib/main_dev.dart
```

#### 2. Структура разработки фичи
Каждая новая фича должна следовать принципам Clean Architecture:

1. **Создание структуры папок:**
```
lib/src/features/your_feature/
├── data/
│   ├── models/
│   ├── mappers/
│   ├── remotes/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── requests/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── pages/
    └── widgets/
```

2. **Последовательность разработки:**
   - Создание сущностей (Entities) в domain слое
   - Определение интерфейсов репозиториев
   - Создание Use Cases
   - Реализация data слоя (models, mappers, repositories)
   - Создание BLoC для управления состоянием
   - Разработка UI (pages и widgets)
   - Регистрация зависимостей в DI контейнере

#### 3. Работа с BLoC
```dart
// Пример создания нового BLoC
class YourFeatureBloc extends BaseBloc<YourFeatureEvent, YourFeatureState> {
  YourFeatureBloc(this._useCase) : super(const YourFeatureState.initial());
  
  final YourFeatureUseCase _useCase;
  
  @override
  void onEventHandler(YourFeatureEvent event, Emitter emit) async {
    await event.when(
      started: () => _started(event as _Started),
      loadData: (request) => _loadData(event as _LoadData, emit),
    );
  }
}
```

#### 4. Регистрация зависимостей
В `manual_register_services.dart`:
```dart
getIt.registerBloc<YourFeatureBloc>(
  factory: true,
  () => YourFeatureBloc(
    getIt<YourFeatureUseCase>(),
  ),
);
```

#### 5. Флейворы и конфигурация
Проект поддерживает три флейвора:
- **Development**: `flutter run --flavor dev --target lib/main_dev.dart`
- **Staging**: `flutter run --flavor staging --target lib/main_staging.dart`
- **Production**: `flutter run --flavor prod --target lib/main_prod.dart`

---

## Code Style

### Настройки линтера
Проект использует `flutter_lints` с дополнительными правилами в `analysis_options.yaml`.

### Основные правила именования

#### Классы и типы
```dart
// UpperCamelCase для классов
class UserAuthentication {}
class ProfileBloc {}
class LoginEvent {}
```

#### Переменные и методы
```dart
// lowerCamelCase для переменных и методов
final userName = 'John';
void getUserData() {}
bool isAuthenticated = false;
```

#### Константы
```dart
// SCREAMING_SNAKE_CASE для констант
const String API_BASE_URL = 'https://api.example.com';
const int MAX_RETRY_ATTEMPTS = 3;
```

#### Файлы и папки
```dart
// snake_case для имен файлов
user_repository.dart
auth_service.dart
home_screen.dart
login_bloc.dart
```

### Структура виджетов
```dart
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading 
        ? const CircularProgressIndicator()
        : Text(label),
    );
  }
}
```

### Use Cases паттерн
```dart
class LoginUseCase extends UseCase<UserEntity, LoginRequest> {
  const LoginUseCase(this._repository);
  
  final IAuthRepository _repository;

  @override
  Future<Either<DomainException, UserEntity>> execute(
    LoginRequest request,
  ) async {
    try {
      final result = await _repository.login(request);
      return Right(result);
    } catch (e) {
      return Left(DomainException.fromException(e));
    }
  }
}
```

### Обработка ошибок
```dart
// Всегда используйте try-catch в критических местах
try {
  final result = await _useCase.call(request);
  result.fold(
    (error) => emit(YourState.error(error.message)),
    (data) => emit(YourState.loaded(data)),
  );
} catch (e) {
  log.e('Unexpected error: $e');
  emit(const YourState.error('Произошла неожиданная ошибка'));
}
```

### Импорты
```dart
// Относительные импорты для внутренних файлов
import '../../../core/base/base_bloc/bloc/base_bloc.dart';
import '../../domain/entities/user_entity.dart';

// Абсолютные импорты для внешних пакетов
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
```

---

## Git Flow

### Основные ветки
- **`prod`** - Продакшн версия, только стабильный код
- **`dev`** - Основная ветка разработки, сюда мержатся все фичи
- **`master`** - Изначальная ветка (deprecated)

### Типы веток и именование

#### Feature ветки
Формат: `feature/TASK-123/short-description`
```bash
# Примеры
feature/LOGIN-001/implement-google-auth
feature/PROFILE-045/add-avatar-upload
feature/NEWS-089/implement-infinite-scroll
```

#### Bug Fix ветки
Формат: `bugfix/TASK-123/short-description`
```bash
# Примеры
bugfix/AUTH-089/fix-token-expiration
bugfix/UI-156/fix-button-alignment
```

#### Hotfix ветки
Формат: `hotfix/TASK-123/short-description`
```bash
# Примеры (срочные исправления для прода)
hotfix/PAY-101/fix-payment-crash
hotfix/SEC-202/fix-auth-vulnerability
```

### Workflow процесс

#### 1. Создание новой фичи
```bash
# Переключиться на dev и обновить
git checkout dev
git pull origin dev

# Создать новую ветку
git checkout -b feature/TASK-123/implement-new-feature

# Разработка...
# После завершения
git add .
git commit -m "feat(feature): implement new feature functionality"
git push origin feature/TASK-123/implement-new-feature
```

#### 2. Merge Request процесс
1. Создать MR из feature ветки в `dev`
2. Указать ревьюеров
3. Убедиться что CI/CD проходит успешно
4. После ревью и одобрения - мерж в `dev`
5. Удалить feature ветку после мержа

#### 3. Release процесс
```bash
# После тестирования в dev
git checkout prod
git pull origin prod
git merge dev
git push origin prod
```

### Конвенция коммитов
Формат: `type(scope): description`

#### Типы коммитов:
- **`feat`** - Новая функциональность
- **`fix`** - Исправление бага
- **`docs`** - Изменения в документации
- **`style`** - Форматирование кода
- **`refactor`** - Рефакторинг без изменения функциональности
- **`test`** - Добавление тестов
- **`chore`** - Технические задачи

#### Примеры коммитов:
```bash
feat(auth): implement biometric login
fix(payments): resolve double charge issue
docs(readme): update installation instructions
style(login): fix button spacing
refactor(core): optimize repository pattern
test(auth): add unit tests for login use case
chore(deps): update flutter dependencies
```

---

## Архитектура

### Общий обзор
Проект построен на **Clean Architecture** принципах с использованием **BLoC** для управления состоянием.

### Структура проекта
```
lib/
├── main.dart
├── main_dev.dart
├── main_staging.dart
├── main_prod.dart
├── firebase_options.dart
└── src/
    ├── app/              # Конфигурация приложения
    ├── core/             # Общие компоненты
    └── features/         # Бизнес фичи
```

### Слои архитектуры

#### 1. Presentation Layer (UI)
**Ответственность:** Отображение данных и обработка пользовательского ввода

```
features/feature_name/presentation/
├── bloc/
│   ├── feature_bloc.dart
│   ├── feature_event.dart
│   ├── feature_state.dart
│   └── feature_bloc.freezed.dart
├── pages/
│   └── feature_page.dart
└── widgets/
    └── feature_widget.dart
```

**Компоненты:**
- **BLoC**: Управление состоянием UI
- **Pages**: Полноэкранные виджеты (экраны)
- **Widgets**: Переиспользуемые UI компоненты

#### 2. Domain Layer (Бизнес-логика)
**Ответственность:** Бизнес-правила и логика, независимая от внешних источников

```
features/feature_name/domain/
├── entities/
│   └── feature_entity.dart
├── requests/
│   └── feature_request.dart
├── repositories/
│   └── i_feature_repository.dart
└── usecases/
    └── feature_use_case.dart
```

**Компоненты:**
- **Entities**: Бизнес-объекты
- **Requests**: Модели запросов
- **Repository Interfaces**: Абстракции для доступа к данным
- **Use Cases**: Отдельные бизнес-операции

#### 3. Data Layer (Данные)
**Ответственность:** Реализация доступа к данным

```
features/feature_name/data/
├── models/
│   └── feature_model.dart
├── mappers/
│   └── feature_mapper.dart
├── remotes/
│   ├── i_feature_remote.dart
│   └── feature_remote_impl.dart
└── repositories/
    └── feature_repository_impl.dart
```

**Компоненты:**
- **Models**: DTO объекты для API/DB
- **Mappers**: Преобразование между models и entities
- **Remotes**: API клиенты
- **Repository Implementations**: Реализации интерфейсов репозиториев

### Core компоненты

#### Base классы
```
core/base/
├── base_bloc/          # Базовые BLoC классы
├── base_usecase/       # Базовые Use Case классы
├── base_models/        # Базовые модели
└── mapper_interfaces.dart
```

#### Сервисы
```
core/services/
├── injectable/         # Dependency Injection
├── storage/           # Локальное хранилище
├── firebase/          # Firebase интеграция
├── auth/              # Авторизация
└── logging/           # Логирование
```

#### API и сеть
```
core/api/
├── client/
│   └── rest/
├── interceptors/
└── network/
```

### Dependency Injection

#### Автоматическая регистрация (Injectable)
```dart
@injectable
class UserRepository implements IUserRepository {
  const UserRepository(this._remote);
  
  final IUserRemote _remote;
  // ...
}
```

#### Ручная регистрация
```dart
// В manual_register_services.dart
void manualRegisterServices() {
  getIt.registerBloc<UserBloc>(
    factory: true,
    () => UserBloc(getIt<GetUserUseCase>()),
  );
}
```

### Управление состоянием с BLoC

#### Базовый BLoC
```dart
class UserBloc extends BaseBloc<UserEvent, UserState> {
  UserBloc(this._getUserUseCase) : super(const UserState.initial());
  
  final GetUserUseCase _getUserUseCase;
  
  @override
  void onEventHandler(UserEvent event, Emitter emit) async {
    await event.when(
      started: () => _started(),
      getUser: (id) => _getUser(id, emit),
    );
  }
}
```

#### Использование в UI
```dart
class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBlocWidget<UserBloc, UserEvent, UserState>(
      bloc: getIt<UserBloc>(),
      starterEvent: const UserEvent.started(),
      builder: (context, state, bloc) {
        return state.when(
          loading: () => const CircularProgressIndicator(),
          loaded: (user) => UserWidget(user: user),
          error: (message) => ErrorWidget(message),
        );
      },
    );
  }
}
```

### Маршрутизация (GoRouter)

#### Конфигурация роутов
```dart
// В route_list.dart
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
      StatefulShellBranch(
        navigatorKey: leftTabNavigatorKey,
        routes: [
          GoRoute(
            path: RoutePaths.feature,
            pageBuilder: (context, state) => getPage(
              child: const FeaturePage(),
              state: state,
            ),
          ),
        ],
      ),
    ],
  ),
];
```

### Обработка ошибок

#### Domain исключения
```dart
class DomainException implements Exception {
  const DomainException({
    required this.message,
    this.stackTrace,
  });
  
  final String message;
  final StackTrace? stackTrace;
}
```

#### Result паттерн
```dart
class Result<T, E> {
  const Result.success(this.data) : failure = null;
  const Result.failure(this.failure) : data = null;
  
  final T? data;
  final E? failure;
  
  bool get isSuccessful => failure == null;
}
```

### Локализация
```dart
// Использование в коде
Text(S.of(context).welcome_message)

// Поддерживаемые языки настраиваются в
// core/localization/generated/l10n.dart
```

### Тестирование

#### Unit тесты
```dart
group('UserBloc', () {
  late UserBloc bloc;
  late MockGetUserUseCase mockUseCase;
  
  setUp(() {
    mockUseCase = MockGetUserUseCase();
    bloc = UserBloc(mockUseCase);
  });
  
  test('should emit loading then loaded when getting user succeeds', () {
    // Arrange
    when(() => mockUseCase.call(any()))
        .thenAnswer((_) async => Result.success(testUser));
    
    // Act
    bloc.add(const UserEvent.getUser('123'));
    
    // Assert
    expectLater(
      bloc.stream,
      emitsInOrder([
        const UserState.loading(),
        UserState.loaded(testUser),
      ]),
    );
  });
});
```

### Best Practices

1. **Разделение ответственности**: Каждый слой отвечает только за свою область
2. **Dependency Inversion**: Зависимость от абстракций, а не от конкретных реализаций
3. **Single Responsibility**: Каждый класс решает одну задачу
4. **Immutable State**: Состояние BLoC должно быть неизменяемым
5. **Error Handling**: Обрабатывайте ошибки на каждом слое
6. **Code Generation**: Используйте Freezed для data классов и JSON сериализации
7. **Resource Management**: Освобождайте ресурсы в dispose методах

---

## Заключение

Эта документация описывает основные принципы и подходы, используемые в проекте My Point. Следование этим принципам обеспечивает:

- Высокую поддерживаемость кода
- Простоту тестирования
- Масштабируемость архитектуры
- Единообразие кодовой базы
- Эффективную командную работу

При возникновении вопросов обращайтесь к техническому лиду проекта или создавайте issue в репозитории. 