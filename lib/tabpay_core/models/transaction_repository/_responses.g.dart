// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateInvoiceReqImpl _$$CreateInvoiceReqImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateInvoiceReqImpl(
      amount: json['amount'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? "",
    );

Map<String, dynamic> _$$CreateInvoiceReqImplToJson(
        _$CreateInvoiceReqImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'phoneNumber': instance.phoneNumber,
    };

_$InvoiceDetailModelImpl _$$InvoiceDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceDetailModelImpl(
      id: json['id'] as String? ?? '',
      amount: json['amount'] as String? ?? "",
    );

Map<String, dynamic> _$$InvoiceDetailModelImplToJson(
        _$InvoiceDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
    };

_$PayInvoiceReqImpl _$$PayInvoiceReqImplFromJson(Map<String, dynamic> json) =>
    _$PayInvoiceReqImpl(
      id: json['id'] as String? ?? '',
      amount: json['amount'] as String? ?? "",
    );

Map<String, dynamic> _$$PayInvoiceReqImplToJson(_$PayInvoiceReqImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
    };
