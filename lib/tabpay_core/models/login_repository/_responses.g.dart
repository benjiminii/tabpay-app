// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyOtpReqImpl _$$VerifyOtpReqImplFromJson(Map<String, dynamic> json) =>
    _$VerifyOtpReqImpl(
      phone: json['phone'] as String? ?? '',
      otp: json['otp'] as String? ?? "",
    );

Map<String, dynamic> _$$VerifyOtpReqImplToJson(_$VerifyOtpReqImpl instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'otp': instance.otp,
    };

_$CreatePinReqImpl _$$CreatePinReqImplFromJson(Map<String, dynamic> json) =>
    _$CreatePinReqImpl(
      phone: json['phone'] as String? ?? '',
      pin: json['pin'] as String? ?? "",
    );

Map<String, dynamic> _$$CreatePinReqImplToJson(_$CreatePinReqImpl instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'pin': instance.pin,
    };
