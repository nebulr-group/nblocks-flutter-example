import 'package:json_annotation/json_annotation.dart';
part 'schema.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Input$TenantInput {
  Input$TenantInput({this.locale, this.mfa, this.name});

  @override
  factory Input$TenantInput.fromJson(Map<String, dynamic> json) =>
      _$Input$TenantInputFromJson(json);

  final String? locale;

  final bool? mfa;

  final String? name;

  Map<String, dynamic> toJson() => _$Input$TenantInputToJson(this);
  int get hashCode {
    final l$locale = locale;
    final l$mfa = mfa;
    final l$name = name;
    return Object.hashAll([l$locale, l$mfa, l$name]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$TenantInput) || runtimeType != other.runtimeType)
      return false;
    final l$locale = locale;
    final lOther$locale = other.locale;
    if (l$locale != lOther$locale) return false;
    final l$mfa = mfa;
    final lOther$mfa = other.mfa;
    if (l$mfa != lOther$mfa) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    return true;
  }

  Input$TenantInput copyWith(
          {String? Function()? locale,
          bool? Function()? mfa,
          String? Function()? name}) =>
      Input$TenantInput(
          locale: locale == null ? this.locale : locale(),
          mfa: mfa == null ? this.mfa : mfa(),
          name: name == null ? this.name : name());
}

@JsonSerializable(explicitToJson: true)
class Input$UserInput {
  Input$UserInput({this.enabled, required this.id, this.role});

  @override
  factory Input$UserInput.fromJson(Map<String, dynamic> json) =>
      _$Input$UserInputFromJson(json);

  final bool? enabled;

  final String id;

  final String? role;

  Map<String, dynamic> toJson() => _$Input$UserInputToJson(this);
  int get hashCode {
    final l$enabled = enabled;
    final l$id = id;
    final l$role = role;
    return Object.hashAll([l$enabled, l$id, l$role]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$UserInput) || runtimeType != other.runtimeType)
      return false;
    final l$enabled = enabled;
    final lOther$enabled = other.enabled;
    if (l$enabled != lOther$enabled) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$role = role;
    final lOther$role = other.role;
    if (l$role != lOther$role) return false;
    return true;
  }

  Input$UserInput copyWith(
          {bool? Function()? enabled, String? id, String? Function()? role}) =>
      Input$UserInput(
          enabled: enabled == null ? this.enabled : enabled(),
          id: id == null ? this.id : id,
          role: role == null ? this.role : role());
}

const possibleTypesMap = {};
