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

CreateInvoiceReq _$CreateInvoiceReqFromJson(Map<String, dynamic> json) {
  return _CreateInvoiceReq.fromJson(json);
}

/// @nodoc
mixin _$CreateInvoiceReq {
  String get amount => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateInvoiceReqCopyWith<CreateInvoiceReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateInvoiceReqCopyWith<$Res> {
  factory $CreateInvoiceReqCopyWith(
          CreateInvoiceReq value, $Res Function(CreateInvoiceReq) then) =
      _$CreateInvoiceReqCopyWithImpl<$Res, CreateInvoiceReq>;
  @useResult
  $Res call({String amount, String phoneNumber});
}

/// @nodoc
class _$CreateInvoiceReqCopyWithImpl<$Res, $Val extends CreateInvoiceReq>
    implements $CreateInvoiceReqCopyWith<$Res> {
  _$CreateInvoiceReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateInvoiceReqImplCopyWith<$Res>
    implements $CreateInvoiceReqCopyWith<$Res> {
  factory _$$CreateInvoiceReqImplCopyWith(_$CreateInvoiceReqImpl value,
          $Res Function(_$CreateInvoiceReqImpl) then) =
      __$$CreateInvoiceReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String amount, String phoneNumber});
}

/// @nodoc
class __$$CreateInvoiceReqImplCopyWithImpl<$Res>
    extends _$CreateInvoiceReqCopyWithImpl<$Res, _$CreateInvoiceReqImpl>
    implements _$$CreateInvoiceReqImplCopyWith<$Res> {
  __$$CreateInvoiceReqImplCopyWithImpl(_$CreateInvoiceReqImpl _value,
      $Res Function(_$CreateInvoiceReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$CreateInvoiceReqImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateInvoiceReqImpl implements _CreateInvoiceReq {
  const _$CreateInvoiceReqImpl({this.amount = '', this.phoneNumber = ""});

  factory _$CreateInvoiceReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateInvoiceReqImplFromJson(json);

  @override
  @JsonKey()
  final String amount;
  @override
  @JsonKey()
  final String phoneNumber;

  @override
  String toString() {
    return 'CreateInvoiceReq(amount: $amount, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateInvoiceReqImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateInvoiceReqImplCopyWith<_$CreateInvoiceReqImpl> get copyWith =>
      __$$CreateInvoiceReqImplCopyWithImpl<_$CreateInvoiceReqImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateInvoiceReqImplToJson(
      this,
    );
  }
}

abstract class _CreateInvoiceReq implements CreateInvoiceReq {
  const factory _CreateInvoiceReq(
      {final String amount, final String phoneNumber}) = _$CreateInvoiceReqImpl;

  factory _CreateInvoiceReq.fromJson(Map<String, dynamic> json) =
      _$CreateInvoiceReqImpl.fromJson;

  @override
  String get amount;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$CreateInvoiceReqImplCopyWith<_$CreateInvoiceReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceDetailModel _$InvoiceDetailModelFromJson(Map<String, dynamic> json) {
  return _InvoiceDetailModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDetailModel {
  String get id => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceDetailModelCopyWith<InvoiceDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailModelCopyWith<$Res> {
  factory $InvoiceDetailModelCopyWith(
          InvoiceDetailModel value, $Res Function(InvoiceDetailModel) then) =
      _$InvoiceDetailModelCopyWithImpl<$Res, InvoiceDetailModel>;
  @useResult
  $Res call({String id, String amount});
}

/// @nodoc
class _$InvoiceDetailModelCopyWithImpl<$Res, $Val extends InvoiceDetailModel>
    implements $InvoiceDetailModelCopyWith<$Res> {
  _$InvoiceDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceDetailModelImplCopyWith<$Res>
    implements $InvoiceDetailModelCopyWith<$Res> {
  factory _$$InvoiceDetailModelImplCopyWith(_$InvoiceDetailModelImpl value,
          $Res Function(_$InvoiceDetailModelImpl) then) =
      __$$InvoiceDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String amount});
}

/// @nodoc
class __$$InvoiceDetailModelImplCopyWithImpl<$Res>
    extends _$InvoiceDetailModelCopyWithImpl<$Res, _$InvoiceDetailModelImpl>
    implements _$$InvoiceDetailModelImplCopyWith<$Res> {
  __$$InvoiceDetailModelImplCopyWithImpl(_$InvoiceDetailModelImpl _value,
      $Res Function(_$InvoiceDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_$InvoiceDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDetailModelImpl implements _InvoiceDetailModel {
  const _$InvoiceDetailModelImpl({this.id = '', this.amount = ""});

  factory _$InvoiceDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDetailModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String amount;

  @override
  String toString() {
    return 'InvoiceDetailModel(id: $id, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDetailModelImplCopyWith<_$InvoiceDetailModelImpl> get copyWith =>
      __$$InvoiceDetailModelImplCopyWithImpl<_$InvoiceDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceDetailModelImplToJson(
      this,
    );
  }
}

abstract class _InvoiceDetailModel implements InvoiceDetailModel {
  const factory _InvoiceDetailModel({final String id, final String amount}) =
      _$InvoiceDetailModelImpl;

  factory _InvoiceDetailModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceDetailModelImpl.fromJson;

  @override
  String get id;
  @override
  String get amount;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceDetailModelImplCopyWith<_$InvoiceDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PayInvoiceReq _$PayInvoiceReqFromJson(Map<String, dynamic> json) {
  return _PayInvoiceReq.fromJson(json);
}

/// @nodoc
mixin _$PayInvoiceReq {
  String get id => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayInvoiceReqCopyWith<PayInvoiceReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayInvoiceReqCopyWith<$Res> {
  factory $PayInvoiceReqCopyWith(
          PayInvoiceReq value, $Res Function(PayInvoiceReq) then) =
      _$PayInvoiceReqCopyWithImpl<$Res, PayInvoiceReq>;
  @useResult
  $Res call({String id, String amount});
}

/// @nodoc
class _$PayInvoiceReqCopyWithImpl<$Res, $Val extends PayInvoiceReq>
    implements $PayInvoiceReqCopyWith<$Res> {
  _$PayInvoiceReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayInvoiceReqImplCopyWith<$Res>
    implements $PayInvoiceReqCopyWith<$Res> {
  factory _$$PayInvoiceReqImplCopyWith(
          _$PayInvoiceReqImpl value, $Res Function(_$PayInvoiceReqImpl) then) =
      __$$PayInvoiceReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String amount});
}

/// @nodoc
class __$$PayInvoiceReqImplCopyWithImpl<$Res>
    extends _$PayInvoiceReqCopyWithImpl<$Res, _$PayInvoiceReqImpl>
    implements _$$PayInvoiceReqImplCopyWith<$Res> {
  __$$PayInvoiceReqImplCopyWithImpl(
      _$PayInvoiceReqImpl _value, $Res Function(_$PayInvoiceReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_$PayInvoiceReqImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayInvoiceReqImpl implements _PayInvoiceReq {
  const _$PayInvoiceReqImpl({this.id = '', this.amount = ""});

  factory _$PayInvoiceReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayInvoiceReqImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String amount;

  @override
  String toString() {
    return 'PayInvoiceReq(id: $id, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayInvoiceReqImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayInvoiceReqImplCopyWith<_$PayInvoiceReqImpl> get copyWith =>
      __$$PayInvoiceReqImplCopyWithImpl<_$PayInvoiceReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayInvoiceReqImplToJson(
      this,
    );
  }
}

abstract class _PayInvoiceReq implements PayInvoiceReq {
  const factory _PayInvoiceReq({final String id, final String amount}) =
      _$PayInvoiceReqImpl;

  factory _PayInvoiceReq.fromJson(Map<String, dynamic> json) =
      _$PayInvoiceReqImpl.fromJson;

  @override
  String get id;
  @override
  String get amount;
  @override
  @JsonKey(ignore: true)
  _$$PayInvoiceReqImplCopyWith<_$PayInvoiceReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
