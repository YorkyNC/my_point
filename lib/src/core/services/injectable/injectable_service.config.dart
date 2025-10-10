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
import 'package:my_point/src/features/login/domain/usecases/request_otp_code_use_case.dart'
    as _i742;
import 'package:my_point/src/features/login/domain/usecases/sign_in_use_case.dart'
    as _i584;
import 'package:my_point/src/features/login/domain/usecases/sing_up_use_case.dart'
    as _i577;
import 'package:my_point/src/features/login/domain/usecases/verify_otp_use_case.dart'
    as _i395;
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart'
    as _i1033;
import 'package:my_point/src/features/register/data/datasources/remote/i_register_remote.dart'
    as _i773;
import 'package:my_point/src/features/register/data/datasources/remote/register_remote_impl.dart'
    as _i497;
import 'package:my_point/src/features/register/data/repositories/i_register_repository.dart'
    as _i343;
import 'package:my_point/src/features/register/domain/repositories/register_repository_impl.dart'
    as _i554;
import 'package:my_point/src/features/register/domain/usecases/register_pvz_use_case.dart'
    as _i313;
import 'package:my_point/src/features/register/presentation/page/bloc/register_pvz_bloc.dart'
    as _i83;
import 'package:my_point/src/features/scan/data/datasources/remote/i_scan_remote.dart'
    as _i1039;
import 'package:my_point/src/features/scan/data/datasources/remote/scan_remote_impl.dart'
    as _i941;
import 'package:my_point/src/features/scan/data/repositories/i_scan_repository.dart'
    as _i236;
import 'package:my_point/src/features/scan/domain/repositories/scan_repository_impl.dart'
    as _i126;
import 'package:my_point/src/features/scan/domain/usecases/barcode_scan_use_case.dart'
    as _i935;
import 'package:my_point/src/features/scan/domain/usecases/qr_code_scan_use_case.dart'
    as _i496;
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/scanner_bloc.dart'
    as _i559;

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
    await gh.singletonAsync<_i274.DioRestClient>(
      () {
        final i = _i274.DioRestClient();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i1039.IScanRemote>(
      () => _i941.ScanRemoteImpl(),
      instanceName: 'ScanRemoteImpl',
    );
    gh.lazySingleton<_i236.IScanRepository>(
      () => _i126.ScanRepositoryImpl(
          gh<_i1039.IScanRemote>(instanceName: 'ScanRemoteImpl')),
      instanceName: 'ScanRepositoryImpl',
    );
    gh.lazySingleton<_i426.IAuthorizationRemote>(
      () => _i869.AuthorizationRemoteImpl(),
      instanceName: 'AuthorizationRemoteImpl',
    );
    gh.lazySingleton<_i496.QrCodeScanUseCase>(() => _i496.QrCodeScanUseCase(
        gh<_i236.IScanRepository>(instanceName: 'ScanRepositoryImpl')));
    gh.lazySingleton<_i935.BarcodeScanUseCase>(() => _i935.BarcodeScanUseCase(
        gh<_i236.IScanRepository>(instanceName: 'ScanRepositoryImpl')));
    gh.lazySingleton<_i773.IRegisterRemote>(
      () => _i497.RegisterRemoteImpl(gh<_i274.DioRestClient>()),
      instanceName: 'RegisterRemoteImpl',
    );
    gh.factory<_i559.ScannerBloc>(() => _i559.ScannerBloc(
          gh<_i935.BarcodeScanUseCase>(),
          gh<_i496.QrCodeScanUseCase>(),
        ));
    gh.lazySingleton<_i343.IRegisterRepository>(
      () => _i554.RegisterRepositoryImpl(
          gh<_i773.IRegisterRemote>(instanceName: 'RegisterRemoteImpl')),
      instanceName: 'RegisterRepositoryImpl',
    );
    gh.lazySingleton<_i313.RegisterPvzUseCase>(() => _i313.RegisterPvzUseCase(
        gh<_i343.IRegisterRepository>(instanceName: 'RegisterRepositoryImpl')));
    gh.factory<_i83.RegisterPvzBloc>(
        () => _i83.RegisterPvzBloc(gh<_i313.RegisterPvzUseCase>()));
    gh.lazySingleton<_i207.IAuthRepository>(
      () => _i320.AuthorizationRepositoryImpl(gh<_i426.IAuthorizationRemote>(
          instanceName: 'AuthorizationRemoteImpl')),
      instanceName: 'AuthorizationRepositoryImpl',
    );
    gh.lazySingleton<_i577.SignUpUseCase>(() => _i577.SignUpUseCase(
        gh<_i207.IAuthRepository>(
            instanceName: 'AuthorizationRepositoryImpl')));
    gh.lazySingleton<_i584.SignInUseCase>(() => _i584.SignInUseCase(
        gh<_i207.IAuthRepository>(
            instanceName: 'AuthorizationRepositoryImpl')));
    gh.lazySingleton<_i742.RequestOtpCodeUseCase>(() =>
        _i742.RequestOtpCodeUseCase(gh<_i207.IAuthRepository>(
            instanceName: 'AuthorizationRepositoryImpl')));
    gh.lazySingleton<_i395.VerifyOtpUseCase>(() => _i395.VerifyOtpUseCase(
        gh<_i207.IAuthRepository>(
            instanceName: 'AuthorizationRepositoryImpl')));
    gh.factory<_i1033.AuthorizationBloc>(() => _i1033.AuthorizationBloc(
          gh<_i584.SignInUseCase>(),
          gh<_i577.SignUpUseCase>(),
          gh<_i742.RequestOtpCodeUseCase>(),
          gh<_i395.VerifyOtpUseCase>(),
        ));
    return this;
  }
}
