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
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart'
    as _i1033;
import 'package:my_point/src/features/register/presentation/page/bloc/register_pvz_bloc.dart'
    as _i83;

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
    gh.factory<_i83.RegisterPvzBloc>(() => _i83.RegisterPvzBloc());
    gh.factory<_i1033.AuthorizationBloc>(() => _i1033.AuthorizationBloc());
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
    return this;
  }
}
