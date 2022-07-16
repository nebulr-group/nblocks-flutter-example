// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateUser.mutation.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variables$Mutation$UpdateUser _$Variables$Mutation$UpdateUserFromJson(
        Map<String, dynamic> json) =>
    Variables$Mutation$UpdateUser(
      user: Input$UserInput.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Variables$Mutation$UpdateUserToJson(
        Variables$Mutation$UpdateUser instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
    };

Mutation$UpdateUser _$Mutation$UpdateUserFromJson(Map<String, dynamic> json) =>
    Mutation$UpdateUser(
      updateUser: Mutation$UpdateUser$updateUser.fromJson(
          json['updateUser'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$UpdateUserToJson(
        Mutation$UpdateUser instance) =>
    <String, dynamic>{
      'updateUser': instance.updateUser.toJson(),
      '__typename': instance.$__typename,
    };

Mutation$UpdateUser$updateUser _$Mutation$UpdateUser$updateUserFromJson(
        Map<String, dynamic> json) =>
    Mutation$UpdateUser$updateUser(
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

Map<String, dynamic> _$Mutation$UpdateUser$updateUserToJson(
        Mutation$UpdateUser$updateUser instance) =>
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
