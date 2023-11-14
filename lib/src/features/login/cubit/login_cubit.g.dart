// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginStateImpl _$$LoginStateImplFromJson(Map<String, dynamic> json) =>
    _$LoginStateImpl(
      loading: json['loading'] as bool? ?? false,
      phoneNumber: json['phoneNumber'] as String? ?? "",
    );

Map<String, dynamic> _$$LoginStateImplToJson(_$LoginStateImpl instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'phoneNumber': instance.phoneNumber,
    };
