// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      id: json['id'] as int? ?? 0,
      createdDate: json['createdDate'] as String? ?? '',
      transactionAmount: json['transactionAmount'] as int? ?? 0,
      remainingBalance: json['remainingBalance'] as int? ?? 0,
      isIncome: json['isIncome'] as bool? ?? false,
      description: json['description'] as String? ?? "",
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate,
      'transactionAmount': instance.transactionAmount,
      'remainingBalance': instance.remainingBalance,
      'isIncome': instance.isIncome,
      'description': instance.description,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as int? ?? 0,
      createdDate: json['createdDate'] as String? ?? '',
      remainingBalance: json['remainingBalance'] as int? ?? 0,
      accountNo: json['accountNo'] as String? ?? '',
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate,
      'remainingBalance': instance.remainingBalance,
      'accountNo': instance.accountNo,
    };
