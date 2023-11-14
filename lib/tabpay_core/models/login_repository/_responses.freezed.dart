// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerifyOtpReq _$VerifyOtpReqFromJson(Map<String, dynamic> json) {
  return _VerifyOtpReq.fromJson(json);
}

/// @nodoc
mixin _$VerifyOtpReq {
  String get phone => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyOtpReqCopyWith<VerifyOtpReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpReqCopyWith<$Res> {
  factory $VerifyOtpReqCopyWith(
          VerifyOtpReq value, $Res Function(VerifyOtpReq) then) =
      _$VerifyOtpReqCopyWithImpl<$Res, VerifyOtpReq>;
  @useResult
  $Res call({String phone, String otp});
}

/// @nodoc
class _$VerifyOtpReqCopyWithImpl<$Res, $Val extends VerifyOtpReq>
    implements $VerifyOtpReqCopyWith<$Res> {
  _$VerifyOtpReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpReqImplCopyWith<$Res>
    implements $VerifyOtpReqCopyWith<$Res> {
  factory _$$VerifyOtpReqImplCopyWith(
          _$VerifyOtpReqImpl value, $Res Function(_$VerifyOtpReqImpl) then) =
      __$$VerifyOtpReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String otp});
}

/// @nodoc
class __$$VerifyOtpReqImplCopyWithImpl<$Res>
    extends _$VerifyOtpReqCopyWithImpl<$Res, _$VerifyOtpReqImpl>
    implements _$$VerifyOtpReqImplCopyWith<$Res> {
  __$$VerifyOtpReqImplCopyWithImpl(
      _$VerifyOtpReqImpl _value, $Res Function(_$VerifyOtpReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? otp = null,
  }) {
    return _then(_$VerifyOtpReqImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyOtpReqImpl implements _VerifyOtpReq {
  const _$VerifyOtpReqImpl({this.phone = '', this.otp = ""});

  factory _$VerifyOtpReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyOtpReqImplFromJson(json);

  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String otp;

  @override
  String toString() {
    return 'VerifyOtpReq(phone: $phone, otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpReqImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phone, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpReqImplCopyWith<_$VerifyOtpReqImpl> get copyWith =>
      __$$VerifyOtpReqImplCopyWithImpl<_$VerifyOtpReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyOtpReqImplToJson(
      this,
    );
  }
}

abstract class _VerifyOtpReq implements VerifyOtpReq {
  const factory _VerifyOtpReq({final String phone, final String otp}) =
      _$VerifyOtpReqImpl;

  factory _VerifyOtpReq.fromJson(Map<String, dynamic> json) =
      _$VerifyOtpReqImpl.fromJson;

  @override
  String get phone;
  @override
  String get otp;
  @override
  @JsonKey(ignore: true)
  _$$VerifyOtpReqImplCopyWith<_$VerifyOtpReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePinReq _$CreatePinReqFromJson(Map<String, dynamic> json) {
  return _CreatePinReq.fromJson(json);
}

/// @nodoc
mixin _$CreatePinReq {
  String get phone => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatePinReqCopyWith<CreatePinReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePinReqCopyWith<$Res> {
  factory $CreatePinReqCopyWith(
          CreatePinReq value, $Res Function(CreatePinReq) then) =
      _$CreatePinReqCopyWithImpl<$Res, CreatePinReq>;
  @useResult
  $Res call({String phone, String pin});
}

/// @nodoc
class _$CreatePinReqCopyWithImpl<$Res, $Val extends CreatePinReq>
    implements $CreatePinReqCopyWith<$Res> {
  _$CreatePinReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? pin = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePinReqImplCopyWith<$Res>
    implements $CreatePinReqCopyWith<$Res> {
  factory _$$CreatePinReqImplCopyWith(
          _$CreatePinReqImpl value, $Res Function(_$CreatePinReqImpl) then) =
      __$$CreatePinReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String pin});
}

/// @nodoc
class __$$CreatePinReqImplCopyWithImpl<$Res>
    extends _$CreatePinReqCopyWithImpl<$Res, _$CreatePinReqImpl>
    implements _$$CreatePinReqImplCopyWith<$Res> {
  __$$CreatePinReqImplCopyWithImpl(
      _$CreatePinReqImpl _value, $Res Function(_$CreatePinReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? pin = null,
  }) {
    return _then(_$CreatePinReqImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePinReqImpl implements _CreatePinReq {
  const _$CreatePinReqImpl({this.phone = '', this.pin = ""});

  factory _$CreatePinReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePinReqImplFromJson(json);

  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String pin;

  @override
  String toString() {
    return 'CreatePinReq(phone: $phone, pin: $pin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePinReqImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phone, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePinReqImplCopyWith<_$CreatePinReqImpl> get copyWith =>
      __$$CreatePinReqImplCopyWithImpl<_$CreatePinReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePinReqImplToJson(
      this,
    );
  }
}

abstract class _CreatePinReq implements CreatePinReq {
  const factory _CreatePinReq({final String phone, final String pin}) =
      _$CreatePinReqImpl;

  factory _CreatePinReq.fromJson(Map<String, dynamic> json) =
      _$CreatePinReqImpl.fromJson;

  @override
  String get phone;
  @override
  String get pin;
  @override
  @JsonKey(ignore: true)
  _$$CreatePinReqImplCopyWith<_$CreatePinReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
