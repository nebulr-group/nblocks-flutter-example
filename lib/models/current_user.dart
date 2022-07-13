class CurrentUser {
  bool authenticated = false;
  AuthTenantUserResponseDto? user;

  CurrentUser(this.user) {
    authenticated = user != null ? !_isAnonymous() : false;
  }

  _isAnonymous() {
    return user?.username == 'ANONYMOUS';
  }
}

class AuthTenantUserResponseDto {
  final String id;
  final String role;
  final String email;
  final String username;
  final String fullName;
  final bool onboarded;
  final AuthTenantResponseDto tenant;

  const AuthTenantUserResponseDto(
      {required this.id,
      required this.role,
      required this.email,
      required this.username,
      required this.fullName,
      required this.onboarded,
      required this.tenant});

  factory AuthTenantUserResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthTenantUserResponseDto(
        id: json['id'],
        fullName: json['fullName'],
        username: json['username'],
        email: json['email'],
        onboarded: json['onboarded'],
        role: json['role'],
        tenant: AuthTenantResponseDto.fromJson(json['tenant']));
  }
}

class AuthTenantResponseDto {
  final String id;
  final String name;
  final String locale;

  const AuthTenantResponseDto(
      {required this.id, required this.name, required this.locale});

  factory AuthTenantResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthTenantResponseDto(
        id: json['id'], name: json['name'], locale: json['locale']);
  }
}
