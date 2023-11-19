// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      loading: json['loading'] as bool? ?? false,
      transactionList: (json['transactionList'] as List<dynamic>?)
              ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userLogged: json['userLogged'] == null
          ? const UserModel()
          : UserModel.fromJson(json['userLogged'] as Map<String, dynamic>),
      currentState: $enumDecodeNullable(
              _$BottomSectionStateEnumMap, json['currentState']) ??
          BottomSectionState.isDefault,
      isNfcEnabled: json['isNfcEnabled'] as bool? ?? false,
      isSecureNfcEnabled: json['isSecureNfcEnabled'] as bool? ?? false,
      isNfcHceSupported: json['isNfcHceSupported'] as bool? ?? false,
      platformVersion: json['platformVersion'] as String? ?? "",
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'transactionList': instance.transactionList,
      'userLogged': instance.userLogged,
      'currentState': _$BottomSectionStateEnumMap[instance.currentState]!,
      'isNfcEnabled': instance.isNfcEnabled,
      'isSecureNfcEnabled': instance.isSecureNfcEnabled,
      'isNfcHceSupported': instance.isNfcHceSupported,
      'platformVersion': instance.platformVersion,
    };

const _$BottomSectionStateEnumMap = {
  BottomSectionState.isScanning: 'isScanning',
  BottomSectionState.isWaiting: 'isWaiting',
  BottomSectionState.isSuccessful: 'isSuccessful',
  BottomSectionState.isFailed: 'isFailed',
  BottomSectionState.isDefault: 'isDefault',
};
