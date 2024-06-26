// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

/// @nodoc
mixin _$HomeState {
  bool get loading => throw _privateConstructorUsedError;
  List<TransactionModel> get transactionList =>
      throw _privateConstructorUsedError;
  UserModel get userLogged => throw _privateConstructorUsedError;
  BottomSectionState get currentState => throw _privateConstructorUsedError;
  bool get isNfcEnabled => throw _privateConstructorUsedError;
  bool get isSecureNfcEnabled => throw _privateConstructorUsedError;
  bool get isNfcHceSupported => throw _privateConstructorUsedError;
  String get platformVersion => throw _privateConstructorUsedError;
  String get waitingInvoiceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool loading,
      List<TransactionModel> transactionList,
      UserModel userLogged,
      BottomSectionState currentState,
      bool isNfcEnabled,
      bool isSecureNfcEnabled,
      bool isNfcHceSupported,
      String platformVersion,
      String waitingInvoiceId});

  $UserModelCopyWith<$Res> get userLogged;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? transactionList = null,
    Object? userLogged = null,
    Object? currentState = null,
    Object? isNfcEnabled = null,
    Object? isSecureNfcEnabled = null,
    Object? isNfcHceSupported = null,
    Object? platformVersion = null,
    Object? waitingInvoiceId = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionList: null == transactionList
          ? _value.transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      userLogged: null == userLogged
          ? _value.userLogged
          : userLogged // ignore: cast_nullable_to_non_nullable
              as UserModel,
      currentState: null == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as BottomSectionState,
      isNfcEnabled: null == isNfcEnabled
          ? _value.isNfcEnabled
          : isNfcEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSecureNfcEnabled: null == isSecureNfcEnabled
          ? _value.isSecureNfcEnabled
          : isSecureNfcEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isNfcHceSupported: null == isNfcHceSupported
          ? _value.isNfcHceSupported
          : isNfcHceSupported // ignore: cast_nullable_to_non_nullable
              as bool,
      platformVersion: null == platformVersion
          ? _value.platformVersion
          : platformVersion // ignore: cast_nullable_to_non_nullable
              as String,
      waitingInvoiceId: null == waitingInvoiceId
          ? _value.waitingInvoiceId
          : waitingInvoiceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get userLogged {
    return $UserModelCopyWith<$Res>(_value.userLogged, (value) {
      return _then(_value.copyWith(userLogged: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<TransactionModel> transactionList,
      UserModel userLogged,
      BottomSectionState currentState,
      bool isNfcEnabled,
      bool isSecureNfcEnabled,
      bool isNfcHceSupported,
      String platformVersion,
      String waitingInvoiceId});

  @override
  $UserModelCopyWith<$Res> get userLogged;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? transactionList = null,
    Object? userLogged = null,
    Object? currentState = null,
    Object? isNfcEnabled = null,
    Object? isSecureNfcEnabled = null,
    Object? isNfcHceSupported = null,
    Object? platformVersion = null,
    Object? waitingInvoiceId = null,
  }) {
    return _then(_$HomeStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionList: null == transactionList
          ? _value._transactionList
          : transactionList // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      userLogged: null == userLogged
          ? _value.userLogged
          : userLogged // ignore: cast_nullable_to_non_nullable
              as UserModel,
      currentState: null == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as BottomSectionState,
      isNfcEnabled: null == isNfcEnabled
          ? _value.isNfcEnabled
          : isNfcEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSecureNfcEnabled: null == isSecureNfcEnabled
          ? _value.isSecureNfcEnabled
          : isSecureNfcEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isNfcHceSupported: null == isNfcHceSupported
          ? _value.isNfcHceSupported
          : isNfcHceSupported // ignore: cast_nullable_to_non_nullable
              as bool,
      platformVersion: null == platformVersion
          ? _value.platformVersion
          : platformVersion // ignore: cast_nullable_to_non_nullable
              as String,
      waitingInvoiceId: null == waitingInvoiceId
          ? _value.waitingInvoiceId
          : waitingInvoiceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl(
      {this.loading = false,
      final List<TransactionModel> transactionList = const [],
      this.userLogged = const UserModel(),
      this.currentState = BottomSectionState.isDefault,
      this.isNfcEnabled = false,
      this.isSecureNfcEnabled = false,
      this.isNfcHceSupported = false,
      this.platformVersion = "",
      this.waitingInvoiceId = ""})
      : _transactionList = transactionList,
        super._();

  factory _$HomeStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeStateImplFromJson(json);

  @override
  @JsonKey()
  final bool loading;
  final List<TransactionModel> _transactionList;
  @override
  @JsonKey()
  List<TransactionModel> get transactionList {
    if (_transactionList is EqualUnmodifiableListView) return _transactionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionList);
  }

  @override
  @JsonKey()
  final UserModel userLogged;
  @override
  @JsonKey()
  final BottomSectionState currentState;
  @override
  @JsonKey()
  final bool isNfcEnabled;
  @override
  @JsonKey()
  final bool isSecureNfcEnabled;
  @override
  @JsonKey()
  final bool isNfcHceSupported;
  @override
  @JsonKey()
  final String platformVersion;
  @override
  @JsonKey()
  final String waitingInvoiceId;

  @override
  String toString() {
    return 'HomeState(loading: $loading, transactionList: $transactionList, userLogged: $userLogged, currentState: $currentState, isNfcEnabled: $isNfcEnabled, isSecureNfcEnabled: $isSecureNfcEnabled, isNfcHceSupported: $isNfcHceSupported, platformVersion: $platformVersion, waitingInvoiceId: $waitingInvoiceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._transactionList, _transactionList) &&
            (identical(other.userLogged, userLogged) ||
                other.userLogged == userLogged) &&
            (identical(other.currentState, currentState) ||
                other.currentState == currentState) &&
            (identical(other.isNfcEnabled, isNfcEnabled) ||
                other.isNfcEnabled == isNfcEnabled) &&
            (identical(other.isSecureNfcEnabled, isSecureNfcEnabled) ||
                other.isSecureNfcEnabled == isSecureNfcEnabled) &&
            (identical(other.isNfcHceSupported, isNfcHceSupported) ||
                other.isNfcHceSupported == isNfcHceSupported) &&
            (identical(other.platformVersion, platformVersion) ||
                other.platformVersion == platformVersion) &&
            (identical(other.waitingInvoiceId, waitingInvoiceId) ||
                other.waitingInvoiceId == waitingInvoiceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_transactionList),
      userLogged,
      currentState,
      isNfcEnabled,
      isSecureNfcEnabled,
      isNfcHceSupported,
      platformVersion,
      waitingInvoiceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeStateImplToJson(
      this,
    );
  }
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final bool loading,
      final List<TransactionModel> transactionList,
      final UserModel userLogged,
      final BottomSectionState currentState,
      final bool isNfcEnabled,
      final bool isSecureNfcEnabled,
      final bool isNfcHceSupported,
      final String platformVersion,
      final String waitingInvoiceId}) = _$HomeStateImpl;
  const _HomeState._() : super._();

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$HomeStateImpl.fromJson;

  @override
  bool get loading;
  @override
  List<TransactionModel> get transactionList;
  @override
  UserModel get userLogged;
  @override
  BottomSectionState get currentState;
  @override
  bool get isNfcEnabled;
  @override
  bool get isSecureNfcEnabled;
  @override
  bool get isNfcHceSupported;
  @override
  String get platformVersion;
  @override
  String get waitingInvoiceId;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
