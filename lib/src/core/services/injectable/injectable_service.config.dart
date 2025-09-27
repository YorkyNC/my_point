// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_point/src/core/api/client/rest/dio/dio_client.dart' as _i274;
import 'package:my_point/src/core/services/auth/auth_service_impl.dart'
    as _i765;
import 'package:my_point/src/core/services/auth/i_auth_service.dart' as _i1037;
import 'package:my_point/src/features/airport/data/repositories/mock_airport_repository.dart'
    as _i317;
import 'package:my_point/src/features/airport/domain/repositories/airport_repository_impl.dart'
    as _i652;
import 'package:my_point/src/features/authorization/presentaion/bloc/authorization_bloc.dart'
    as _i391;
import 'package:my_point/src/features/create_delivery/presentation/bloc/create_delivery_bloc.dart'
    as _i306;
import 'package:my_point/src/features/login/data/repositories/i_auth_repository.dart'
    as _i207;
import 'package:my_point/src/features/login/domain/repositories/auth_repository_impl.dart'
    as _i713;
import 'package:my_point/src/features/login/domain/usecases/change_permanent_password_use_case.dart'
    as _i320;
import 'package:my_point/src/features/login/domain/usecases/change_temporary_password_use_case.dart'
    as _i975;
import 'package:my_point/src/features/login/domain/usecases/forgot_password_use_case.dart'
    as _i329;
import 'package:my_point/src/features/login/domain/usecases/get_user_use_case.dart'
    as _i305;
import 'package:my_point/src/features/login/domain/usecases/login_use_case.dart'
    as _i681;
import 'package:my_point/src/features/login/domain/usecases/refresh_token_use_case.dart'
    as _i158;
import 'package:my_point/src/features/login/domain/usecases/verify_password_reset_use_case.dart'
    as _i506;
import 'package:my_point/src/features/login/domain/usecases/verify_user_case.dart'
    as _i1055;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i391.AuthorizationBloc>(() => _i391.AuthorizationBloc());
    await gh.singletonAsync<_i274.DioRestClient>(
      () {
        final i = _i274.DioRestClient();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i1037.IAuthService>(
      () => _i765.AuthServiceImpl(gh<_i274.DioRestClient>()),
      instanceName: 'AuthServiceImpl',
    );
    gh.lazySingleton<_i652.AirportRepositoryImpl>(
        () => _i317.MockAirportRepository());
    gh.lazySingleton<_i207.IAuthRepository>(
      () => _i713.AuthRepositoryImpl(
          gh<_i1037.IAuthService>(instanceName: 'AuthServiceImpl')),
      instanceName: 'AuthRepositoryImpl',
    );
    gh.factory<_i306.CreateDeliveryBloc>(
        () => _i306.CreateDeliveryBloc(gh<_i652.AirportRepositoryImpl>()));
    gh.lazySingleton<_i305.GetUserUseCase>(() => _i305.GetUserUseCase(
        gh<_i207.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i975.ChangeTemporaryPasswordUseCase>(() =>
        _i975.ChangeTemporaryPasswordUseCase(
            gh<_i207.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i1055.VerifyUseCase>(() => _i1055.VerifyUseCase(
        gh<_i207.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i158.RefreshTokenUseCase>(() => _i158.RefreshTokenUseCase(
        gh<_i207.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i506.VerifyPasswordResetUseCase>(() =>
        _i506.VerifyPasswordResetUseCase(
            gh<_i207.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i681.LoginUseCase>(() => _i681.LoginUseCase(
        gh<_i207.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i320.ChangePermanentPasswordUseCase>(() =>
        _i320.ChangePermanentPasswordUseCase(
            gh<_i207.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    gh.lazySingleton<_i329.ForgotPasswordUseCase>(() =>
        _i329.ForgotPasswordUseCase(
            gh<_i207.IAuthRepository>(instanceName: 'AuthRepositoryImpl')));
    return this;
  }
}
