import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../main.dart';
import '../../../../core/base/base_bloc/bloc/base_bloc.dart';
import '../../../../core/base/base_usecase/result.dart';
import '../../../../core/exceptions/domain_exception.dart';
import '../../../../core/services/auth/entities/user_entity.dart';
import '../../../../core/services/auth/models/forgot_password_response.dart';
import '../../../../core/services/auth/models/models.dart';
import '../../../../core/services/auth/models/refresh_token_response.dart';
import '../../../../core/services/auth/models/update_password_request.dart';
import '../../../../core/services/auth/models/update_password_response.dart';
import '../../../../core/services/storage/storage_service_impl.dart';
import '../../../../core/utils/token_utils.dart';
import '../../domain/usecases/change_permanent_password_use_case.dart';
import '../../domain/usecases/change_temporary_password_use_case.dart';
import '../../domain/usecases/forgot_password_use_case.dart';
import '../../domain/usecases/get_user_use_case.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/refresh_token_use_case.dart';
import '../../domain/usecases/verify_password_reset_use_case.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  AuthBloc(
    this._loginUseCase,
    this._getUserUseCase,
    this._forgotPasswordUseCase,
    this._changeTemporaryPasswordUseCase,
    this._changePermanentPasswordUseCase,
    this._refreshTokenUseCase,
    this._verifyPasswordResetUseCase,
  ) : super(const _Initial());

  final LoginUseCase _loginUseCase;
  final GetUserUseCase _getUserUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final ChangeTemporaryPasswordUseCase _changeTemporaryPasswordUseCase;
  final ChangePermanentPasswordUseCase _changePermanentPasswordUseCase;
  final RefreshTokenUseCase _refreshTokenUseCase;
  final VerifyPasswordResetUseCase _verifyPasswordResetUseCase;

  var _viewModel = const AuthStateViewModel();

  final StorageServiceImpl st = StorageServiceImpl();

  /// Sets the password reset ID in the viewModel
  /// This is needed for the verification flow
  // void setPasswordResetId(int passwordResetId) {
  //   _viewModel = _viewModel.copyWith(passwordResetId: passwordResetId);
  //   log.e(Updated viewModel with passwordResetId: $passwordResetId');
  // }

  @override
  Future<void> onEventHandler(AuthEvent event, Emitter emit) async {
    await event.when(
      forgotPassword: (usernameOrEmail) => _forgotPassword(
        event as _ForgotPassword,
        emit as Emitter<AuthState>,
      ),
      getUser: () => _getUser(
        event as _GetUser,
        emit as Emitter<AuthState>,
      ),
      changeTemporaryPassword: (password, confirmPassword) =>
          _changeTemporaryPassword(
        event as _ChangeTemporaryPassword,
        emit as Emitter<AuthState>,
      ),
      changePermanentPassword: (password, confirmPassword) =>
          _changePermanentPassword(
        event as _ChangePermanentPassword,
        emit as Emitter<AuthState>,
      ),
      login: (username, password) => _login(
        event as _Login,
        emit as Emitter<AuthState>,
      ),
      verify: (code, password, confirmPassword) => _verify(
        event as _Verify,
        emit as Emitter<AuthState>,
      ),
      verifyOtp: (code, passwordResetId) => _verifyOtp(
        event as _$VerifyOtpImpl,
        emit as Emitter<AuthState>,
      ),
      resetPassword: (password, confirmPassword, passwordResetId) =>
          _resetPassword(
        event as _$ResetPasswordImpl,
        emit as Emitter<AuthState>,
      ),
      refreshToken: () => _refreshToken(
        event as _RefreshToken,
        emit as Emitter<AuthState>,
      ),
      setPasswordResetId: (passwordResetId) => _setPasswordResetId(
        event as _SetPasswordResetId,
        emit as Emitter<AuthState>,
      ),
    );
  }

  Future<void> _setPasswordResetId(
      _SetPasswordResetId event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final String? token = st.getToken();
      final String? refreshToken = st.getRefreshToken();

      if (token != null && token.isNotEmpty) {
        final Map<String, dynamic> tokenPayload =
            TokenUtils.parseTokenPayload(token);
        final bool hasTempPassword = TokenUtils.hasTempPassword(token);

        _viewModel = _viewModel.copyWith(
          passwordResetId: event.passwordResetId,
          token: token,
          refreshToken: refreshToken ?? _viewModel.refreshToken,
          tokenPayload: tokenPayload,
          hasTempPassword: hasTempPassword,
        );
      } else {
        _viewModel =
            _viewModel.copyWith(passwordResetId: event.passwordResetId);
      }

      return emit(AuthState.loaded(viewModel: _viewModel));
    } catch (e) {
      log.e('Error setting password reset ID: $e');
      return emit(AuthState.error('Error setting password reset ID: $e'));
    }
  }

  Future<void> _login(_Login event, Emitter<AuthState> emit) async {
    emit(const _Loading());

    final SignInRequest request =
        SignInRequest(username: event.username, password: event.password);
    final result = await _loginUseCase.call(request);

    log.e(result.toString());

    if (result.isSuccessful) {
      try {
        final String accessToken = result.data!.data.accessToken;
        final String refreshToken = result.data!.data.refreshToken;

        // Parse the token payload
        final Map<String, dynamic> tokenPayload =
            TokenUtils.parseTokenPayload(accessToken);
        final bool hasTempPassword = TokenUtils.hasTempPassword(accessToken);

        // Store tokens
        await st.setToken(accessToken);
        await st.setRefreshToken(refreshToken);

        // Log token info for debugging
        log.d('Token payload: $tokenPayload');
        log.d('Is temporary user: $hasTempPassword');

        return emit(
          AuthState.loaded(
            viewModel: _viewModel.copyWith(
              token: accessToken,
              refreshToken: refreshToken,
              tokenPayload: tokenPayload,
              hasTempPassword: hasTempPassword,
            ),
          ),
        );
      } catch (e) {
        debugPrint('Error during login token operations: $e');
        return emit(
            AuthState.error('Error processing authentication tokens: $e'));
      }
    }

    return emit(
      const AuthState.error('Введенные данные неверны, попробуйте снова'),
    );
  }

  Future<void> _refreshToken(
      _RefreshToken event, Emitter<AuthState> emit) async {
    emit(const _Initial());
    final Result<RefreshTokenResponse, DomainException> result =
        await _refreshTokenUseCase.call();

    if (result.isSuccessful && result.data != null) {
      try {
        final String accessToken = result.data!.data.accessToken;
        final String refreshToken = result.data!.data.refreshToken;

        // Parse the token payload
        final Map<String, dynamic> tokenPayload =
            TokenUtils.parseTokenPayload(accessToken);
        final bool hasTempPassword = TokenUtils.hasTempPassword(accessToken);

        return emit(
          _Loaded(
            viewModel: _viewModel.copyWith(
              token: accessToken,
              refreshToken: refreshToken,
              tokenPayload: tokenPayload,
              hasTempPassword: hasTempPassword,
            ),
          ),
        );
      } catch (e) {
        debugPrint('Error during refresh token operations: $e');
        return emit(AuthState.error('Error processing refreshed tokens: $e'));
      }
    }
    return emit(const _Error("Refresh failed"));
  }

  Future<void> _getUser(_GetUser event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final Result<UserEntity, DomainException> result =
          await _getUserUseCase.call();

      if (result.isSuccessful && result.data != null) {
        // Get current token and parse its payload
        final String? token = st.getToken();
        Map<String, dynamic> tokenPayload = {};
        bool hasTempPassword = false;
        if (token != null && token.isNotEmpty) {
          tokenPayload = TokenUtils.parseTokenPayload(token);
          hasTempPassword = TokenUtils.hasTempPassword(token);
        }

        emit(AuthState.loaded(
          viewModel: _viewModel.copyWith(
            user: result.data!,
            token: token ?? '',
            tokenPayload: tokenPayload,
            hasTempPassword: hasTempPassword,
          ),
        ));
      }
    } catch (e) {
      log.e('Error in _getUser: $e');
      return emit(AuthState.error(
          e is DomainException ? e.message : 'An unexpected error occurred'));
    }
  }

  Future<void> _changeTemporaryPassword(
      _ChangeTemporaryPassword event, Emitter<AuthState> emit) async {
    emit(const _Loading());

    try {
      final UpdatePasswordRequest request = UpdatePasswordRequest(
        password: event.password,
        confirmPassword: event.confirmPassword,
      );

      log.d('Updating password with request: ${request.toJson()}');

      final Result<UpdatePasswordResponse, DomainException> result =
          await _changeTemporaryPasswordUseCase.call(request);

      if (result.isSuccessful) {
        log.i('Password update successful');

        final String? token = st.getToken();
        if (token != null && token.isNotEmpty) {
          final Map<String, dynamic> tokenPayload =
              TokenUtils.parseTokenPayload(token);

          return emit(
            _Loaded(
              viewModel: _viewModel.copyWith(
                token: token,
                tokenPayload: tokenPayload,
                hasTempPassword: false,
              ),
            ),
          );
        } else {
          return emit(
            _Loaded(
              viewModel: _viewModel.copyWith(
                hasTempPassword: false,
              ),
            ),
          );
        }
      } else {
        log.e('Password update failed: ${result.failure!.message}');
        return emit(_Error(result.failure!.message));
      }
    } catch (e) {
      log.e('Exception during password update: $e');
      return emit(_Error("An error occurred during password update: $e"));
    }
  }

  Future<void> _changePermanentPassword(
      _ChangePermanentPassword event, Emitter<AuthState> emit) async {
    emit(const _Loading());

    try {
      // Create the request with both password and confirmPassword
      final UpdatePasswordRequest request = UpdatePasswordRequest(
        password: event.password,
        confirmPassword: event.confirmPassword,
      );

      log.d('Updating password with request: ${request.toJson()}');

      // Call the setNewPassword method instead of updatePassword
      final Result<UpdatePasswordResponse, DomainException> result =
          await _changePermanentPasswordUseCase.call(request);

      if (result.isSuccessful) {
        log.i('Password update successful');

        final String? token = st.getToken();
        if (token != null && token.isNotEmpty) {
          final Map<String, dynamic> tokenPayload =
              TokenUtils.parseTokenPayload(token);

          return emit(
            _Loaded(
              viewModel: _viewModel.copyWith(
                token: token,
                tokenPayload: tokenPayload,
                hasTempPassword: false,
              ),
            ),
          );
        } else {
          return emit(
            _Loaded(
              viewModel: _viewModel.copyWith(
                hasTempPassword: false,
              ),
            ),
          );
        }
      } else {
        log.e('Password update failed: ${result.failure!.message}');
        return emit(_Error(result.failure!.message));
      }
    } catch (e) {
      log.e('Exception during password update: $e');
      return emit(_Error("An error occurred during password update: $e"));
    }
  }

  Future<void> _forgotPassword(
      _ForgotPassword event, Emitter<AuthState> emit) async {
    emit(const _Initial());
    final ForgotPasswordRequest request = ForgotPasswordRequest(
      email: event.email,
    );
    final Result<ForgotPasswordResponses, DomainException> result =
        await _forgotPasswordUseCase.call(request);

    return result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (success) => emit(
        AuthState.loaded(
          viewModel: _viewModel.copyWith(
            passwordResetId: result.data!.data.passwordResetId,
          ),
        ),
      ),
    );
  }

  Future<void> _verifyOtp(
      _$VerifyOtpImpl event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final VerifyRequest request = VerifyRequest(
      code: event.code,
    );

    log.d('Verifying OTP with passwordResetId: ${event.passwordResetId}');

    // Call verifyPasswordReset directly using the passwordResetId from the event
    final passwordResetResult = await _verifyPasswordResetUseCase.execute(
        request, event.passwordResetId);

    return passwordResetResult.fold(
      (failure) => emit(AuthState.errorVerify(failure.message)),
      (success) {
        // Update the ViewModel with the passwordResetId for later steps
        _viewModel =
            _viewModel.copyWith(passwordResetId: event.passwordResetId);
        return emit(AuthState.verified(viewModel: _viewModel));
      },
    );
  }

  Future<void> _resetPassword(
      _$ResetPasswordImpl event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    // Use the passwordResetId from the event directly
    final int passwordResetId = event.passwordResetId;

    log.d('Resetting password with passwordResetId: $passwordResetId');

    final VerifyRequest request = VerifyRequest(
      password: event.password,
      confirmPassword: event.confirmPassword,
    );

    // Call verifyPasswordReset directly with the passwordResetId from the event
    final passwordResetResult =
        await _verifyPasswordResetUseCase.execute(request, passwordResetId);

    return passwordResetResult.fold(
      (failure) => emit(AuthState.errorVerify(failure.message)),
      (success) {
        // Clear passwordResetId and navigate to login
        _viewModel = _viewModel.copyWith(passwordResetId: null);
        return emit(const AuthState.passwordReset());
      },
    );
  }

  // Keep for backward compatibility, but delegate to the new methods
  Future<void> _verify(_Verify event, Emitter<AuthState> emit) async {
    // If only code is provided, call verifyOtp
    if (event.code != null &&
        event.password == null &&
        event.confirmPassword == null) {
      // Make sure we have a passwordResetId from the ViewModel
      if (_viewModel.passwordResetId == null) {
        return emit(const AuthState.errorVerify(
            'Password reset session expired. Please start over.'));
      }
      return _verifyOtp(
          _$VerifyOtpImpl(
            code: event.code!,
            passwordResetId: _viewModel.passwordResetId!,
          ),
          emit);
    }
    // If password and confirmPassword are provided, call resetPassword
    else if (event.password != null && event.confirmPassword != null) {
      // Make sure we have a passwordResetId from the ViewModel
      if (_viewModel.passwordResetId == null) {
        return emit(const AuthState.errorVerify(
            'Password reset session expired. Please start over.'));
      }
      return _resetPassword(
          _$ResetPasswordImpl(
            password: event.password!,
            confirmPassword: event.confirmPassword!,
            passwordResetId: _viewModel.passwordResetId!,
          ),
          emit);
    }
    // Invalid combination, emit error
    else {
      emit(const AuthState.errorVerify('Invalid parameters for verify event'));
    }
  }

  T? extractClaim<T>(String claimKey) {
    final state = this.state;
    if (state is _Loaded || state is _Verified) {
      final viewModel =
          state is _Loaded ? (state).viewModel : (state as _Verified).viewModel;

      if (viewModel.tokenPayload.containsKey(claimKey)) {
        return viewModel.tokenPayload[claimKey] as T?;
      }
    }
    return null;
  }

  bool isTemporaryUser() {
    final state = this.state;
    if (state is _Loaded || state is _Verified) {
      final viewModel =
          state is _Loaded ? (state).viewModel : (state as _Verified).viewModel;

      return viewModel.hasTempPassword;
    }
    return false;
  }
}
