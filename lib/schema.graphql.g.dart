// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Input$TenantInput _$Input$TenantInputFromJson(Map<String, dynamic> json) =>
    Input$TenantInput(
      locale: json['locale'] as String?,
      mfa: json['mfa'] as bool?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$Input$TenantInputToJson(Input$TenantInput instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'mfa': instance.mfa,
      'name': instance.name,
    };

Input$UserInput _$Input$UserInputFromJson(Map<String, dynamic> json) =>
    Input$UserInput(
      enabled: json['enabled'] as bool?,
      id: json['id'] as String,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$Input$UserInputToJson(Input$UserInput instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'id': instance.id,
      'role': instance.role,
    };
