// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res, PaymentEvent>;
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res, $Val extends PaymentEvent>
    implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CardNumberChangedImplCopyWith<$Res> {
  factory _$$CardNumberChangedImplCopyWith(_$CardNumberChangedImpl value,
          $Res Function(_$CardNumberChangedImpl) then) =
      __$$CardNumberChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String digit});
}

/// @nodoc
class __$$CardNumberChangedImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$CardNumberChangedImpl>
    implements _$$CardNumberChangedImplCopyWith<$Res> {
  __$$CardNumberChangedImplCopyWithImpl(_$CardNumberChangedImpl _value,
      $Res Function(_$CardNumberChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digit = null,
  }) {
    return _then(_$CardNumberChangedImpl(
      null == digit
          ? _value.digit
          : digit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CardNumberChangedImpl implements CardNumberChanged {
  const _$CardNumberChangedImpl(this.digit);

  @override
  final String digit;

  @override
  String toString() {
    return 'PaymentEvent.cardNumberChanged(digit: $digit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardNumberChangedImpl &&
            (identical(other.digit, digit) || other.digit == digit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, digit);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardNumberChangedImplCopyWith<_$CardNumberChangedImpl> get copyWith =>
      __$$CardNumberChangedImplCopyWithImpl<_$CardNumberChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return cardNumberChanged(digit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return cardNumberChanged?.call(digit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (cardNumberChanged != null) {
      return cardNumberChanged(digit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return cardNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return cardNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (cardNumberChanged != null) {
      return cardNumberChanged(this);
    }
    return orElse();
  }
}

abstract class CardNumberChanged implements PaymentEvent {
  const factory CardNumberChanged(final String digit) = _$CardNumberChangedImpl;

  String get digit;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardNumberChangedImplCopyWith<_$CardNumberChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpiryChangedImplCopyWith<$Res> {
  factory _$$ExpiryChangedImplCopyWith(
          _$ExpiryChangedImpl value, $Res Function(_$ExpiryChangedImpl) then) =
      __$$ExpiryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String digit});
}

/// @nodoc
class __$$ExpiryChangedImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$ExpiryChangedImpl>
    implements _$$ExpiryChangedImplCopyWith<$Res> {
  __$$ExpiryChangedImplCopyWithImpl(
      _$ExpiryChangedImpl _value, $Res Function(_$ExpiryChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digit = null,
  }) {
    return _then(_$ExpiryChangedImpl(
      null == digit
          ? _value.digit
          : digit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExpiryChangedImpl implements ExpiryChanged {
  const _$ExpiryChangedImpl(this.digit);

  @override
  final String digit;

  @override
  String toString() {
    return 'PaymentEvent.expiryChanged(digit: $digit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpiryChangedImpl &&
            (identical(other.digit, digit) || other.digit == digit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, digit);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpiryChangedImplCopyWith<_$ExpiryChangedImpl> get copyWith =>
      __$$ExpiryChangedImplCopyWithImpl<_$ExpiryChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return expiryChanged(digit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return expiryChanged?.call(digit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (expiryChanged != null) {
      return expiryChanged(digit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return expiryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return expiryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (expiryChanged != null) {
      return expiryChanged(this);
    }
    return orElse();
  }
}

abstract class ExpiryChanged implements PaymentEvent {
  const factory ExpiryChanged(final String digit) = _$ExpiryChangedImpl;

  String get digit;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpiryChangedImplCopyWith<_$ExpiryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CvvChangedImplCopyWith<$Res> {
  factory _$$CvvChangedImplCopyWith(
          _$CvvChangedImpl value, $Res Function(_$CvvChangedImpl) then) =
      __$$CvvChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String digit});
}

/// @nodoc
class __$$CvvChangedImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$CvvChangedImpl>
    implements _$$CvvChangedImplCopyWith<$Res> {
  __$$CvvChangedImplCopyWithImpl(
      _$CvvChangedImpl _value, $Res Function(_$CvvChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digit = null,
  }) {
    return _then(_$CvvChangedImpl(
      null == digit
          ? _value.digit
          : digit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CvvChangedImpl implements CvvChanged {
  const _$CvvChangedImpl(this.digit);

  @override
  final String digit;

  @override
  String toString() {
    return 'PaymentEvent.cvvChanged(digit: $digit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CvvChangedImpl &&
            (identical(other.digit, digit) || other.digit == digit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, digit);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CvvChangedImplCopyWith<_$CvvChangedImpl> get copyWith =>
      __$$CvvChangedImplCopyWithImpl<_$CvvChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return cvvChanged(digit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return cvvChanged?.call(digit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (cvvChanged != null) {
      return cvvChanged(digit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return cvvChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return cvvChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (cvvChanged != null) {
      return cvvChanged(this);
    }
    return orElse();
  }
}

abstract class CvvChanged implements PaymentEvent {
  const factory CvvChanged(final String digit) = _$CvvChangedImpl;

  String get digit;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CvvChangedImplCopyWith<_$CvvChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CardHolderNameChangedImplCopyWith<$Res> {
  factory _$$CardHolderNameChangedImplCopyWith(
          _$CardHolderNameChangedImpl value,
          $Res Function(_$CardHolderNameChangedImpl) then) =
      __$$CardHolderNameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CardHolderNameChangedImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$CardHolderNameChangedImpl>
    implements _$$CardHolderNameChangedImplCopyWith<$Res> {
  __$$CardHolderNameChangedImplCopyWithImpl(_$CardHolderNameChangedImpl _value,
      $Res Function(_$CardHolderNameChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$CardHolderNameChangedImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CardHolderNameChangedImpl implements CardHolderNameChanged {
  const _$CardHolderNameChangedImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'PaymentEvent.cardHolderNameChanged(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardHolderNameChangedImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardHolderNameChangedImplCopyWith<_$CardHolderNameChangedImpl>
      get copyWith => __$$CardHolderNameChangedImplCopyWithImpl<
          _$CardHolderNameChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return cardHolderNameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return cardHolderNameChanged?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (cardHolderNameChanged != null) {
      return cardHolderNameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return cardHolderNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return cardHolderNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (cardHolderNameChanged != null) {
      return cardHolderNameChanged(this);
    }
    return orElse();
  }
}

abstract class CardHolderNameChanged implements PaymentEvent {
  const factory CardHolderNameChanged(final String name) =
      _$CardHolderNameChangedImpl;

  String get name;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardHolderNameChangedImplCopyWith<_$CardHolderNameChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BackspacePressedImplCopyWith<$Res> {
  factory _$$BackspacePressedImplCopyWith(_$BackspacePressedImpl value,
          $Res Function(_$BackspacePressedImpl) then) =
      __$$BackspacePressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackspacePressedImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$BackspacePressedImpl>
    implements _$$BackspacePressedImplCopyWith<$Res> {
  __$$BackspacePressedImplCopyWithImpl(_$BackspacePressedImpl _value,
      $Res Function(_$BackspacePressedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BackspacePressedImpl implements BackspacePressed {
  const _$BackspacePressedImpl();

  @override
  String toString() {
    return 'PaymentEvent.backspacePressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BackspacePressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return backspacePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return backspacePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (backspacePressed != null) {
      return backspacePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return backspacePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return backspacePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (backspacePressed != null) {
      return backspacePressed(this);
    }
    return orElse();
  }
}

abstract class BackspacePressed implements PaymentEvent {
  const factory BackspacePressed() = _$BackspacePressedImpl;
}

/// @nodoc
abstract class _$$ClearFieldImplCopyWith<$Res> {
  factory _$$ClearFieldImplCopyWith(
          _$ClearFieldImpl value, $Res Function(_$ClearFieldImpl) then) =
      __$$ClearFieldImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentField field});
}

/// @nodoc
class __$$ClearFieldImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$ClearFieldImpl>
    implements _$$ClearFieldImplCopyWith<$Res> {
  __$$ClearFieldImplCopyWithImpl(
      _$ClearFieldImpl _value, $Res Function(_$ClearFieldImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
  }) {
    return _then(_$ClearFieldImpl(
      null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as PaymentField,
    ));
  }
}

/// @nodoc

class _$ClearFieldImpl implements ClearField {
  const _$ClearFieldImpl(this.field);

  @override
  final PaymentField field;

  @override
  String toString() {
    return 'PaymentEvent.clearField(field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearFieldImpl &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearFieldImplCopyWith<_$ClearFieldImpl> get copyWith =>
      __$$ClearFieldImplCopyWithImpl<_$ClearFieldImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return clearField(field);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return clearField?.call(field);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (clearField != null) {
      return clearField(field);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return clearField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return clearField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (clearField != null) {
      return clearField(this);
    }
    return orElse();
  }
}

abstract class ClearField implements PaymentEvent {
  const factory ClearField(final PaymentField field) = _$ClearFieldImpl;

  PaymentField get field;

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClearFieldImplCopyWith<_$ClearFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateFormImplCopyWith<$Res> {
  factory _$$ValidateFormImplCopyWith(
          _$ValidateFormImpl value, $Res Function(_$ValidateFormImpl) then) =
      __$$ValidateFormImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidateFormImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$ValidateFormImpl>
    implements _$$ValidateFormImplCopyWith<$Res> {
  __$$ValidateFormImplCopyWithImpl(
      _$ValidateFormImpl _value, $Res Function(_$ValidateFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ValidateFormImpl implements ValidateForm {
  const _$ValidateFormImpl();

  @override
  String toString() {
    return 'PaymentEvent.validateForm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ValidateFormImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return validateForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return validateForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (validateForm != null) {
      return validateForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return validateForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return validateForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (validateForm != null) {
      return validateForm(this);
    }
    return orElse();
  }
}

abstract class ValidateForm implements PaymentEvent {
  const factory ValidateForm() = _$ValidateFormImpl;
}

/// @nodoc
abstract class _$$SubmitCardImplCopyWith<$Res> {
  factory _$$SubmitCardImplCopyWith(
          _$SubmitCardImpl value, $Res Function(_$SubmitCardImpl) then) =
      __$$SubmitCardImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitCardImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$SubmitCardImpl>
    implements _$$SubmitCardImplCopyWith<$Res> {
  __$$SubmitCardImplCopyWithImpl(
      _$SubmitCardImpl _value, $Res Function(_$SubmitCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitCardImpl implements SubmitCard {
  const _$SubmitCardImpl();

  @override
  String toString() {
    return 'PaymentEvent.submitCard()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitCardImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return submitCard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return submitCard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (submitCard != null) {
      return submitCard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return submitCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return submitCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (submitCard != null) {
      return submitCard(this);
    }
    return orElse();
  }
}

abstract class SubmitCard implements PaymentEvent {
  const factory SubmitCard() = _$SubmitCardImpl;
}

/// @nodoc
abstract class _$$ResetFormImplCopyWith<$Res> {
  factory _$$ResetFormImplCopyWith(
          _$ResetFormImpl value, $Res Function(_$ResetFormImpl) then) =
      __$$ResetFormImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetFormImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$ResetFormImpl>
    implements _$$ResetFormImplCopyWith<$Res> {
  __$$ResetFormImplCopyWithImpl(
      _$ResetFormImpl _value, $Res Function(_$ResetFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetFormImpl implements ResetForm {
  const _$ResetFormImpl();

  @override
  String toString() {
    return 'PaymentEvent.resetForm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetFormImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return resetForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return resetForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (resetForm != null) {
      return resetForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return resetForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return resetForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (resetForm != null) {
      return resetForm(this);
    }
    return orElse();
  }
}

abstract class ResetForm implements PaymentEvent {
  const factory ResetForm() = _$ResetFormImpl;
}

/// @nodoc
abstract class _$$LoadStoredCardsImplCopyWith<$Res> {
  factory _$$LoadStoredCardsImplCopyWith(_$LoadStoredCardsImpl value,
          $Res Function(_$LoadStoredCardsImpl) then) =
      __$$LoadStoredCardsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadStoredCardsImplCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res, _$LoadStoredCardsImpl>
    implements _$$LoadStoredCardsImplCopyWith<$Res> {
  __$$LoadStoredCardsImplCopyWithImpl(
      _$LoadStoredCardsImpl _value, $Res Function(_$LoadStoredCardsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadStoredCardsImpl implements LoadStoredCards {
  const _$LoadStoredCardsImpl();

  @override
  String toString() {
    return 'PaymentEvent.loadStoredCards()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadStoredCardsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String digit) cardNumberChanged,
    required TResult Function(String digit) expiryChanged,
    required TResult Function(String digit) cvvChanged,
    required TResult Function(String name) cardHolderNameChanged,
    required TResult Function() backspacePressed,
    required TResult Function(PaymentField field) clearField,
    required TResult Function() validateForm,
    required TResult Function() submitCard,
    required TResult Function() resetForm,
    required TResult Function() loadStoredCards,
  }) {
    return loadStoredCards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String digit)? cardNumberChanged,
    TResult? Function(String digit)? expiryChanged,
    TResult? Function(String digit)? cvvChanged,
    TResult? Function(String name)? cardHolderNameChanged,
    TResult? Function()? backspacePressed,
    TResult? Function(PaymentField field)? clearField,
    TResult? Function()? validateForm,
    TResult? Function()? submitCard,
    TResult? Function()? resetForm,
    TResult? Function()? loadStoredCards,
  }) {
    return loadStoredCards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String digit)? cardNumberChanged,
    TResult Function(String digit)? expiryChanged,
    TResult Function(String digit)? cvvChanged,
    TResult Function(String name)? cardHolderNameChanged,
    TResult Function()? backspacePressed,
    TResult Function(PaymentField field)? clearField,
    TResult Function()? validateForm,
    TResult Function()? submitCard,
    TResult Function()? resetForm,
    TResult Function()? loadStoredCards,
    required TResult orElse(),
  }) {
    if (loadStoredCards != null) {
      return loadStoredCards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CardNumberChanged value) cardNumberChanged,
    required TResult Function(ExpiryChanged value) expiryChanged,
    required TResult Function(CvvChanged value) cvvChanged,
    required TResult Function(CardHolderNameChanged value)
        cardHolderNameChanged,
    required TResult Function(BackspacePressed value) backspacePressed,
    required TResult Function(ClearField value) clearField,
    required TResult Function(ValidateForm value) validateForm,
    required TResult Function(SubmitCard value) submitCard,
    required TResult Function(ResetForm value) resetForm,
    required TResult Function(LoadStoredCards value) loadStoredCards,
  }) {
    return loadStoredCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CardNumberChanged value)? cardNumberChanged,
    TResult? Function(ExpiryChanged value)? expiryChanged,
    TResult? Function(CvvChanged value)? cvvChanged,
    TResult? Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult? Function(BackspacePressed value)? backspacePressed,
    TResult? Function(ClearField value)? clearField,
    TResult? Function(ValidateForm value)? validateForm,
    TResult? Function(SubmitCard value)? submitCard,
    TResult? Function(ResetForm value)? resetForm,
    TResult? Function(LoadStoredCards value)? loadStoredCards,
  }) {
    return loadStoredCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CardNumberChanged value)? cardNumberChanged,
    TResult Function(ExpiryChanged value)? expiryChanged,
    TResult Function(CvvChanged value)? cvvChanged,
    TResult Function(CardHolderNameChanged value)? cardHolderNameChanged,
    TResult Function(BackspacePressed value)? backspacePressed,
    TResult Function(ClearField value)? clearField,
    TResult Function(ValidateForm value)? validateForm,
    TResult Function(SubmitCard value)? submitCard,
    TResult Function(ResetForm value)? resetForm,
    TResult Function(LoadStoredCards value)? loadStoredCards,
    required TResult orElse(),
  }) {
    if (loadStoredCards != null) {
      return loadStoredCards(this);
    }
    return orElse();
  }
}

abstract class LoadStoredCards implements PaymentEvent {
  const factory LoadStoredCards() = _$LoadStoredCardsImpl;
}

/// @nodoc
mixin _$PaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() validating,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
    required TResult Function() cardsLoading,
    required TResult Function(PaymentViewModel card) cardsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? validating,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? cardsLoading,
    TResult? Function(PaymentViewModel card)? cardsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? validating,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    TResult Function()? cardsLoading,
    TResult Function(PaymentViewModel card)? cardsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInitial value) initial,
    required TResult Function(PaymentValidating value) validating,
    required TResult Function(PaymentSubmitting value) submitting,
    required TResult Function(PaymentSuccess value) success,
    required TResult Function(PaymentFailure value) failure,
    required TResult Function(PaymentCardsLoading value) cardsLoading,
    required TResult Function(PaymentCardsLoaded value) cardsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInitial value)? initial,
    TResult? Function(PaymentValidating value)? validating,
    TResult? Function(PaymentSubmitting value)? submitting,
    TResult? Function(PaymentSuccess value)? success,
    TResult? Function(PaymentFailure value)? failure,
    TResult? Function(PaymentCardsLoading value)? cardsLoading,
    TResult? Function(PaymentCardsLoaded value)? cardsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInitial value)? initial,
    TResult Function(PaymentValidating value)? validating,
    TResult Function(PaymentSubmitting value)? submitting,
    TResult Function(PaymentSuccess value)? success,
    TResult Function(PaymentFailure value)? failure,
    TResult Function(PaymentCardsLoading value)? cardsLoading,
    TResult Function(PaymentCardsLoaded value)? cardsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PaymentInitialImplCopyWith<$Res> {
  factory _$$PaymentInitialImplCopyWith(_$PaymentInitialImpl value,
          $Res Function(_$PaymentInitialImpl) then) =
      __$$PaymentInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentInitialImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentInitialImpl>
    implements _$$PaymentInitialImplCopyWith<$Res> {
  __$$PaymentInitialImplCopyWithImpl(
      _$PaymentInitialImpl _value, $Res Function(_$PaymentInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PaymentInitialImpl implements PaymentInitial {
  const _$PaymentInitialImpl();

  @override
  String toString() {
    return 'PaymentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() validating,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
    required TResult Function() cardsLoading,
    required TResult Function(PaymentViewModel card) cardsLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? validating,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? cardsLoading,
    TResult? Function(PaymentViewModel card)? cardsLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? validating,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    TResult Function()? cardsLoading,
    TResult Function(PaymentViewModel card)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInitial value) initial,
    required TResult Function(PaymentValidating value) validating,
    required TResult Function(PaymentSubmitting value) submitting,
    required TResult Function(PaymentSuccess value) success,
    required TResult Function(PaymentFailure value) failure,
    required TResult Function(PaymentCardsLoading value) cardsLoading,
    required TResult Function(PaymentCardsLoaded value) cardsLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInitial value)? initial,
    TResult? Function(PaymentValidating value)? validating,
    TResult? Function(PaymentSubmitting value)? submitting,
    TResult? Function(PaymentSuccess value)? success,
    TResult? Function(PaymentFailure value)? failure,
    TResult? Function(PaymentCardsLoading value)? cardsLoading,
    TResult? Function(PaymentCardsLoaded value)? cardsLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInitial value)? initial,
    TResult Function(PaymentValidating value)? validating,
    TResult Function(PaymentSubmitting value)? submitting,
    TResult Function(PaymentSuccess value)? success,
    TResult Function(PaymentFailure value)? failure,
    TResult Function(PaymentCardsLoading value)? cardsLoading,
    TResult Function(PaymentCardsLoaded value)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PaymentInitial implements PaymentState {
  const factory PaymentInitial() = _$PaymentInitialImpl;
}

/// @nodoc
abstract class _$$PaymentValidatingImplCopyWith<$Res> {
  factory _$$PaymentValidatingImplCopyWith(_$PaymentValidatingImpl value,
          $Res Function(_$PaymentValidatingImpl) then) =
      __$$PaymentValidatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentValidatingImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentValidatingImpl>
    implements _$$PaymentValidatingImplCopyWith<$Res> {
  __$$PaymentValidatingImplCopyWithImpl(_$PaymentValidatingImpl _value,
      $Res Function(_$PaymentValidatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PaymentValidatingImpl implements PaymentValidating {
  const _$PaymentValidatingImpl();

  @override
  String toString() {
    return 'PaymentState.validating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentValidatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() validating,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
    required TResult Function() cardsLoading,
    required TResult Function(PaymentViewModel card) cardsLoaded,
  }) {
    return validating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? validating,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? cardsLoading,
    TResult? Function(PaymentViewModel card)? cardsLoaded,
  }) {
    return validating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? validating,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    TResult Function()? cardsLoading,
    TResult Function(PaymentViewModel card)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (validating != null) {
      return validating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInitial value) initial,
    required TResult Function(PaymentValidating value) validating,
    required TResult Function(PaymentSubmitting value) submitting,
    required TResult Function(PaymentSuccess value) success,
    required TResult Function(PaymentFailure value) failure,
    required TResult Function(PaymentCardsLoading value) cardsLoading,
    required TResult Function(PaymentCardsLoaded value) cardsLoaded,
  }) {
    return validating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInitial value)? initial,
    TResult? Function(PaymentValidating value)? validating,
    TResult? Function(PaymentSubmitting value)? submitting,
    TResult? Function(PaymentSuccess value)? success,
    TResult? Function(PaymentFailure value)? failure,
    TResult? Function(PaymentCardsLoading value)? cardsLoading,
    TResult? Function(PaymentCardsLoaded value)? cardsLoaded,
  }) {
    return validating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInitial value)? initial,
    TResult Function(PaymentValidating value)? validating,
    TResult Function(PaymentSubmitting value)? submitting,
    TResult Function(PaymentSuccess value)? success,
    TResult Function(PaymentFailure value)? failure,
    TResult Function(PaymentCardsLoading value)? cardsLoading,
    TResult Function(PaymentCardsLoaded value)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (validating != null) {
      return validating(this);
    }
    return orElse();
  }
}

abstract class PaymentValidating implements PaymentState {
  const factory PaymentValidating() = _$PaymentValidatingImpl;
}

/// @nodoc
abstract class _$$PaymentSubmittingImplCopyWith<$Res> {
  factory _$$PaymentSubmittingImplCopyWith(_$PaymentSubmittingImpl value,
          $Res Function(_$PaymentSubmittingImpl) then) =
      __$$PaymentSubmittingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentSubmittingImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentSubmittingImpl>
    implements _$$PaymentSubmittingImplCopyWith<$Res> {
  __$$PaymentSubmittingImplCopyWithImpl(_$PaymentSubmittingImpl _value,
      $Res Function(_$PaymentSubmittingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PaymentSubmittingImpl implements PaymentSubmitting {
  const _$PaymentSubmittingImpl();

  @override
  String toString() {
    return 'PaymentState.submitting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentSubmittingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() validating,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
    required TResult Function() cardsLoading,
    required TResult Function(PaymentViewModel card) cardsLoaded,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? validating,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? cardsLoading,
    TResult? Function(PaymentViewModel card)? cardsLoaded,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? validating,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    TResult Function()? cardsLoading,
    TResult Function(PaymentViewModel card)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInitial value) initial,
    required TResult Function(PaymentValidating value) validating,
    required TResult Function(PaymentSubmitting value) submitting,
    required TResult Function(PaymentSuccess value) success,
    required TResult Function(PaymentFailure value) failure,
    required TResult Function(PaymentCardsLoading value) cardsLoading,
    required TResult Function(PaymentCardsLoaded value) cardsLoaded,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInitial value)? initial,
    TResult? Function(PaymentValidating value)? validating,
    TResult? Function(PaymentSubmitting value)? submitting,
    TResult? Function(PaymentSuccess value)? success,
    TResult? Function(PaymentFailure value)? failure,
    TResult? Function(PaymentCardsLoading value)? cardsLoading,
    TResult? Function(PaymentCardsLoaded value)? cardsLoaded,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInitial value)? initial,
    TResult Function(PaymentValidating value)? validating,
    TResult Function(PaymentSubmitting value)? submitting,
    TResult Function(PaymentSuccess value)? success,
    TResult Function(PaymentFailure value)? failure,
    TResult Function(PaymentCardsLoading value)? cardsLoading,
    TResult Function(PaymentCardsLoaded value)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class PaymentSubmitting implements PaymentState {
  const factory PaymentSubmitting() = _$PaymentSubmittingImpl;
}

/// @nodoc
abstract class _$$PaymentSuccessImplCopyWith<$Res> {
  factory _$$PaymentSuccessImplCopyWith(_$PaymentSuccessImpl value,
          $Res Function(_$PaymentSuccessImpl) then) =
      __$$PaymentSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PaymentSuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentSuccessImpl>
    implements _$$PaymentSuccessImplCopyWith<$Res> {
  __$$PaymentSuccessImplCopyWithImpl(
      _$PaymentSuccessImpl _value, $Res Function(_$PaymentSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PaymentSuccessImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentSuccessImpl implements PaymentSuccess {
  const _$PaymentSuccessImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'PaymentState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSuccessImplCopyWith<_$PaymentSuccessImpl> get copyWith =>
      __$$PaymentSuccessImplCopyWithImpl<_$PaymentSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() validating,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
    required TResult Function() cardsLoading,
    required TResult Function(PaymentViewModel card) cardsLoaded,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? validating,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? cardsLoading,
    TResult? Function(PaymentViewModel card)? cardsLoaded,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? validating,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    TResult Function()? cardsLoading,
    TResult Function(PaymentViewModel card)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInitial value) initial,
    required TResult Function(PaymentValidating value) validating,
    required TResult Function(PaymentSubmitting value) submitting,
    required TResult Function(PaymentSuccess value) success,
    required TResult Function(PaymentFailure value) failure,
    required TResult Function(PaymentCardsLoading value) cardsLoading,
    required TResult Function(PaymentCardsLoaded value) cardsLoaded,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInitial value)? initial,
    TResult? Function(PaymentValidating value)? validating,
    TResult? Function(PaymentSubmitting value)? submitting,
    TResult? Function(PaymentSuccess value)? success,
    TResult? Function(PaymentFailure value)? failure,
    TResult? Function(PaymentCardsLoading value)? cardsLoading,
    TResult? Function(PaymentCardsLoaded value)? cardsLoaded,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInitial value)? initial,
    TResult Function(PaymentValidating value)? validating,
    TResult Function(PaymentSubmitting value)? submitting,
    TResult Function(PaymentSuccess value)? success,
    TResult Function(PaymentFailure value)? failure,
    TResult Function(PaymentCardsLoading value)? cardsLoading,
    TResult Function(PaymentCardsLoaded value)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PaymentSuccess implements PaymentState {
  const factory PaymentSuccess({required final String message}) =
      _$PaymentSuccessImpl;

  String get message;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentSuccessImplCopyWith<_$PaymentSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentFailureImplCopyWith<$Res> {
  factory _$$PaymentFailureImplCopyWith(_$PaymentFailureImpl value,
          $Res Function(_$PaymentFailureImpl) then) =
      __$$PaymentFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PaymentFailureImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentFailureImpl>
    implements _$$PaymentFailureImplCopyWith<$Res> {
  __$$PaymentFailureImplCopyWithImpl(
      _$PaymentFailureImpl _value, $Res Function(_$PaymentFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PaymentFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentFailureImpl implements PaymentFailure {
  const _$PaymentFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'PaymentState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentFailureImplCopyWith<_$PaymentFailureImpl> get copyWith =>
      __$$PaymentFailureImplCopyWithImpl<_$PaymentFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() validating,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
    required TResult Function() cardsLoading,
    required TResult Function(PaymentViewModel card) cardsLoaded,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? validating,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? cardsLoading,
    TResult? Function(PaymentViewModel card)? cardsLoaded,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? validating,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    TResult Function()? cardsLoading,
    TResult Function(PaymentViewModel card)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInitial value) initial,
    required TResult Function(PaymentValidating value) validating,
    required TResult Function(PaymentSubmitting value) submitting,
    required TResult Function(PaymentSuccess value) success,
    required TResult Function(PaymentFailure value) failure,
    required TResult Function(PaymentCardsLoading value) cardsLoading,
    required TResult Function(PaymentCardsLoaded value) cardsLoaded,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInitial value)? initial,
    TResult? Function(PaymentValidating value)? validating,
    TResult? Function(PaymentSubmitting value)? submitting,
    TResult? Function(PaymentSuccess value)? success,
    TResult? Function(PaymentFailure value)? failure,
    TResult? Function(PaymentCardsLoading value)? cardsLoading,
    TResult? Function(PaymentCardsLoaded value)? cardsLoaded,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInitial value)? initial,
    TResult Function(PaymentValidating value)? validating,
    TResult Function(PaymentSubmitting value)? submitting,
    TResult Function(PaymentSuccess value)? success,
    TResult Function(PaymentFailure value)? failure,
    TResult Function(PaymentCardsLoading value)? cardsLoading,
    TResult Function(PaymentCardsLoaded value)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PaymentFailure implements PaymentState {
  const factory PaymentFailure({required final String message}) =
      _$PaymentFailureImpl;

  String get message;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentFailureImplCopyWith<_$PaymentFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentCardsLoadingImplCopyWith<$Res> {
  factory _$$PaymentCardsLoadingImplCopyWith(_$PaymentCardsLoadingImpl value,
          $Res Function(_$PaymentCardsLoadingImpl) then) =
      __$$PaymentCardsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentCardsLoadingImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentCardsLoadingImpl>
    implements _$$PaymentCardsLoadingImplCopyWith<$Res> {
  __$$PaymentCardsLoadingImplCopyWithImpl(_$PaymentCardsLoadingImpl _value,
      $Res Function(_$PaymentCardsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PaymentCardsLoadingImpl implements PaymentCardsLoading {
  const _$PaymentCardsLoadingImpl();

  @override
  String toString() {
    return 'PaymentState.cardsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCardsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() validating,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
    required TResult Function() cardsLoading,
    required TResult Function(PaymentViewModel card) cardsLoaded,
  }) {
    return cardsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? validating,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? cardsLoading,
    TResult? Function(PaymentViewModel card)? cardsLoaded,
  }) {
    return cardsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? validating,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    TResult Function()? cardsLoading,
    TResult Function(PaymentViewModel card)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (cardsLoading != null) {
      return cardsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInitial value) initial,
    required TResult Function(PaymentValidating value) validating,
    required TResult Function(PaymentSubmitting value) submitting,
    required TResult Function(PaymentSuccess value) success,
    required TResult Function(PaymentFailure value) failure,
    required TResult Function(PaymentCardsLoading value) cardsLoading,
    required TResult Function(PaymentCardsLoaded value) cardsLoaded,
  }) {
    return cardsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInitial value)? initial,
    TResult? Function(PaymentValidating value)? validating,
    TResult? Function(PaymentSubmitting value)? submitting,
    TResult? Function(PaymentSuccess value)? success,
    TResult? Function(PaymentFailure value)? failure,
    TResult? Function(PaymentCardsLoading value)? cardsLoading,
    TResult? Function(PaymentCardsLoaded value)? cardsLoaded,
  }) {
    return cardsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInitial value)? initial,
    TResult Function(PaymentValidating value)? validating,
    TResult Function(PaymentSubmitting value)? submitting,
    TResult Function(PaymentSuccess value)? success,
    TResult Function(PaymentFailure value)? failure,
    TResult Function(PaymentCardsLoading value)? cardsLoading,
    TResult Function(PaymentCardsLoaded value)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (cardsLoading != null) {
      return cardsLoading(this);
    }
    return orElse();
  }
}

abstract class PaymentCardsLoading implements PaymentState {
  const factory PaymentCardsLoading() = _$PaymentCardsLoadingImpl;
}

/// @nodoc
abstract class _$$PaymentCardsLoadedImplCopyWith<$Res> {
  factory _$$PaymentCardsLoadedImplCopyWith(_$PaymentCardsLoadedImpl value,
          $Res Function(_$PaymentCardsLoadedImpl) then) =
      __$$PaymentCardsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentViewModel card});

  $PaymentViewModelCopyWith<$Res> get card;
}

/// @nodoc
class __$$PaymentCardsLoadedImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentCardsLoadedImpl>
    implements _$$PaymentCardsLoadedImplCopyWith<$Res> {
  __$$PaymentCardsLoadedImplCopyWithImpl(_$PaymentCardsLoadedImpl _value,
      $Res Function(_$PaymentCardsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
  }) {
    return _then(_$PaymentCardsLoadedImpl(
      null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as PaymentViewModel,
    ));
  }

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentViewModelCopyWith<$Res> get card {
    return $PaymentViewModelCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value));
    });
  }
}

/// @nodoc

class _$PaymentCardsLoadedImpl implements PaymentCardsLoaded {
  const _$PaymentCardsLoadedImpl(this.card);

  @override
  final PaymentViewModel card;

  @override
  String toString() {
    return 'PaymentState.cardsLoaded(card: $card)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCardsLoadedImpl &&
            (identical(other.card, card) || other.card == card));
  }

  @override
  int get hashCode => Object.hash(runtimeType, card);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCardsLoadedImplCopyWith<_$PaymentCardsLoadedImpl> get copyWith =>
      __$$PaymentCardsLoadedImplCopyWithImpl<_$PaymentCardsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() validating,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
    required TResult Function() cardsLoading,
    required TResult Function(PaymentViewModel card) cardsLoaded,
  }) {
    return cardsLoaded(card);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? validating,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
    TResult? Function()? cardsLoading,
    TResult? Function(PaymentViewModel card)? cardsLoaded,
  }) {
    return cardsLoaded?.call(card);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? validating,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    TResult Function()? cardsLoading,
    TResult Function(PaymentViewModel card)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (cardsLoaded != null) {
      return cardsLoaded(card);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentInitial value) initial,
    required TResult Function(PaymentValidating value) validating,
    required TResult Function(PaymentSubmitting value) submitting,
    required TResult Function(PaymentSuccess value) success,
    required TResult Function(PaymentFailure value) failure,
    required TResult Function(PaymentCardsLoading value) cardsLoading,
    required TResult Function(PaymentCardsLoaded value) cardsLoaded,
  }) {
    return cardsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PaymentInitial value)? initial,
    TResult? Function(PaymentValidating value)? validating,
    TResult? Function(PaymentSubmitting value)? submitting,
    TResult? Function(PaymentSuccess value)? success,
    TResult? Function(PaymentFailure value)? failure,
    TResult? Function(PaymentCardsLoading value)? cardsLoading,
    TResult? Function(PaymentCardsLoaded value)? cardsLoaded,
  }) {
    return cardsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentInitial value)? initial,
    TResult Function(PaymentValidating value)? validating,
    TResult Function(PaymentSubmitting value)? submitting,
    TResult Function(PaymentSuccess value)? success,
    TResult Function(PaymentFailure value)? failure,
    TResult Function(PaymentCardsLoading value)? cardsLoading,
    TResult Function(PaymentCardsLoaded value)? cardsLoaded,
    required TResult orElse(),
  }) {
    if (cardsLoaded != null) {
      return cardsLoaded(this);
    }
    return orElse();
  }
}

abstract class PaymentCardsLoaded implements PaymentState {
  const factory PaymentCardsLoaded(final PaymentViewModel card) =
      _$PaymentCardsLoadedImpl;

  PaymentViewModel get card;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentCardsLoadedImplCopyWith<_$PaymentCardsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentViewModel {
  String get cardNumber => throw _privateConstructorUsedError;
  String get expiry => throw _privateConstructorUsedError;
  String get cvv => throw _privateConstructorUsedError;
  String get cardHolderName => throw _privateConstructorUsedError;

  /// Create a copy of PaymentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentViewModelCopyWith<PaymentViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentViewModelCopyWith<$Res> {
  factory $PaymentViewModelCopyWith(
          PaymentViewModel value, $Res Function(PaymentViewModel) then) =
      _$PaymentViewModelCopyWithImpl<$Res, PaymentViewModel>;
  @useResult
  $Res call(
      {String cardNumber, String expiry, String cvv, String cardHolderName});
}

/// @nodoc
class _$PaymentViewModelCopyWithImpl<$Res, $Val extends PaymentViewModel>
    implements $PaymentViewModelCopyWith<$Res> {
  _$PaymentViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? expiry = null,
    Object? cvv = null,
    Object? cardHolderName = null,
  }) {
    return _then(_value.copyWith(
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      cardHolderName: null == cardHolderName
          ? _value.cardHolderName
          : cardHolderName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentViewModelImplCopyWith<$Res>
    implements $PaymentViewModelCopyWith<$Res> {
  factory _$$PaymentViewModelImplCopyWith(_$PaymentViewModelImpl value,
          $Res Function(_$PaymentViewModelImpl) then) =
      __$$PaymentViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cardNumber, String expiry, String cvv, String cardHolderName});
}

/// @nodoc
class __$$PaymentViewModelImplCopyWithImpl<$Res>
    extends _$PaymentViewModelCopyWithImpl<$Res, _$PaymentViewModelImpl>
    implements _$$PaymentViewModelImplCopyWith<$Res> {
  __$$PaymentViewModelImplCopyWithImpl(_$PaymentViewModelImpl _value,
      $Res Function(_$PaymentViewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? expiry = null,
    Object? cvv = null,
    Object? cardHolderName = null,
  }) {
    return _then(_$PaymentViewModelImpl(
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      cardHolderName: null == cardHolderName
          ? _value.cardHolderName
          : cardHolderName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentViewModelImpl implements _PaymentViewModel {
  const _$PaymentViewModelImpl(
      {this.cardNumber = '',
      this.expiry = '',
      this.cvv = '',
      this.cardHolderName = ''});

  @override
  @JsonKey()
  final String cardNumber;
  @override
  @JsonKey()
  final String expiry;
  @override
  @JsonKey()
  final String cvv;
  @override
  @JsonKey()
  final String cardHolderName;

  @override
  String toString() {
    return 'PaymentViewModel(cardNumber: $cardNumber, expiry: $expiry, cvv: $cvv, cardHolderName: $cardHolderName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentViewModelImpl &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.expiry, expiry) || other.expiry == expiry) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            (identical(other.cardHolderName, cardHolderName) ||
                other.cardHolderName == cardHolderName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cardNumber, expiry, cvv, cardHolderName);

  /// Create a copy of PaymentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentViewModelImplCopyWith<_$PaymentViewModelImpl> get copyWith =>
      __$$PaymentViewModelImplCopyWithImpl<_$PaymentViewModelImpl>(
          this, _$identity);
}

abstract class _PaymentViewModel implements PaymentViewModel {
  const factory _PaymentViewModel(
      {final String cardNumber,
      final String expiry,
      final String cvv,
      final String cardHolderName}) = _$PaymentViewModelImpl;

  @override
  String get cardNumber;
  @override
  String get expiry;
  @override
  String get cvv;
  @override
  String get cardHolderName;

  /// Create a copy of PaymentViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentViewModelImplCopyWith<_$PaymentViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
