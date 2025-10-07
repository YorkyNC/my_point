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
import 'package:my_point/src/features/login/data/datasources/remote/authorization_remote_impl.dart'
    as _i869;
import 'package:my_point/src/features/login/data/datasources/remote/i_authorization_remote.dart'
    as _i426;
import 'package:my_point/src/features/login/data/repositories/i_auth_repository.dart'
    as _i207;
import 'package:my_point/src/features/login/domain/repositories/authorization_repository_impl.dart'
    as _i320;
import 'package:my_point/src/features/login/domain/usecases/sign_in_use_case.dart'
    as _i584;
import 'package:my_point/src/features/login/domain/usecases/sing_up_use_case.dart'
    as _i577;
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart'
    as _i1033;
import 'package:my_point/src/features/register/presentation/page/bloc/register_pvz_bloc.dart'
    as _i83;
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/q_r_bloc.dart'
    as _i283;

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
    gh.factory<_i283.QRBloc>(() => _i283.QRBloc());
    gh.factory<_i83.RegisterPvzBloc>(() => _i83.RegisterPvzBloc());
    gh.factory<_i1033.AuthorizationBloc>(() => _i1033.AuthorizationBloc());
    await gh.singletonAsync<_i274.DioRestClient>(
      () {
        final i = _i274.DioRestClient();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i426.IAuthorizationRemote>(
      () => _i869.AuthorizationRemoteImpl(),
      instanceName: 'AuthorizationRemoteImpl',
    );
    gh.lazySingleton<_i207.IAuthRepository>(
      () => _i320.AuthorizationRepositoryImpl(
          gh<_i426.IAuthorizationRemote>(instanceName: 'IAuthorizationRemote')),
      instanceName: 'AuthorizationRepositoryImpl',
    );
    gh.lazySingleton<_i577.SignUpUseCase>(() => _i577.SignUpUseCase(
        gh<_i207.IAuthRepository>(
            instanceName: 'AuthorizationRepositoryImpl')));
    gh.lazySingleton<_i584.SignInUseCase>(() => _i584.SignInUseCase(
        gh<_i207.IAuthRepository>(
            instanceName: 'AuthorizationRepositoryImpl')));
    return this;
  }
}
