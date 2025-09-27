import '../../../features/login/domain/usecases/change_permanent_password_use_case.dart';
import '../../../features/login/domain/usecases/change_temporary_password_use_case.dart';
import '../../../features/login/domain/usecases/forgot_password_use_case.dart';
import '../../../features/login/domain/usecases/get_user_use_case.dart';
import '../../../features/login/domain/usecases/login_use_case.dart';
import '../../../features/login/domain/usecases/refresh_token_use_case.dart';
import '../../../features/login/domain/usecases/verify_password_reset_use_case.dart';
import '../../../features/login/presentation/bloc/auth_bloc.dart';
import 'injectable_service.dart';
import 'service_register_proxy.dart';

void manualRegisterServices() {
  // getIt.registerBloc(
  //   () => ProfileBloc(
  //       getIt<GetProfileUseCase>(), getIt<GetCurrentRoleStreamUseCase>()),
  // );

  // getIt.registerLazySingleton<WebSocketService>(
  //   () => WebSocketService(),
  // );

  getIt.registerBloc<AuthBloc>(
    factory: true,
    () => AuthBloc(
      getIt<LoginUseCase>(),
      getIt<GetUserUseCase>(),
      getIt<ForgotPasswordUseCase>(),
      getIt<ChangeTemporaryPasswordUseCase>(),
      getIt<ChangePermanentPasswordUseCase>(),
      getIt<RefreshTokenUseCase>(),
      getIt<VerifyPasswordResetUseCase>(),
    ),
  );
}
