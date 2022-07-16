// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listUsers.query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Query$ListUsers _$Query$ListUsersFromJson(Map<String, dynamic> json) =>
    Query$ListUsers(
      listUsers: (json['listUsers'] as List<dynamic>)
          .map((e) =>
              Query$ListUsers$listUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$ListUsersToJson(Query$ListUsers instance) =>
    <String, dynamic>{
      'listUsers': instance.listUsers.map((e) => e.toJson()).toList(),
      '__typename': instance.$__typename,
    };

Query$ListUsers$listUsers _$Query$ListUsers$listUsersFromJson(
        Map<String, dynamic> json) =>
    Query$ListUsers$listUsers(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      createdAt: json['createdAt'] as String?,
      onboarded: json['onboarded'] as bool?,
      enabled: json['enabled'] as bool?,
      role: json['role'] as String?,
      teams:
          (json['teams'] as List<dynamic>?)?.map((e) => e as String).toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$ListUsers$listUsersToJson(
        Query$ListUsers$listUsers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'username': instance.username,
      'createdAt': instance.createdAt,
      'onboarded': instance.onboarded,
      'enabled': instance.enabled,
      'role': instance.role,
      'teams': instance.teams,
      '__typename': instance.$__typename,
    };
