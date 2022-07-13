import 'dart:convert';

import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:my_app/models/current_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // The client used by this service expects to be setup with auth interceptors
  final InterceptedClient _client;
  final String _baseUrl;
  final bool _debug;
  final Map<String, String> _endpoints = const {
    "authenticate": "/auth-proxy/authenticate",
    "authenticated": "/auth-proxy/authenticated",
    "tenantUsers": "/auth-proxy/tenantUsers",
    "currentUser": "/auth/currentUser",
    "password": "/auth-proxy/password",
    "user": "/auth-proxy/user",
    "socialLogin": "/social-login",
    "commitMfaCode": "/auth-proxy/commitMfaCode",
    "startMfaUserSetup": "/auth-proxy/startMfaUserSetup",
    "finishMfaUserSetup": "/auth-proxy/finishMfaUserSetup",
    "resetUserMfaSetup": "/auth-proxy/resetUserMfaSetup"
  };

  static const String _AUTH_TOKEN_KEY = "NBLOCKS_AUTH_TOKEN";
  static const String _TENANT_USER_ID_KEY = "NBLOCKS_TENANT_USER_ID";
  static const String _MFA_TOKEN_KEY = "NBLOCKS_MFA_TOKEN";

  const AuthService(this._baseUrl, this._client, this._debug);

  Future<bool> checkCurrentUserAuthenticated() async {
    if (await _hasFullAuthContext()) {
      if (await authenticated()) {
        return true;
      }
    }

    return false;
  }

  // Authenticate a user
  Future<MfaState> authenticate(String username, String password) async {
    final response = await _client.post(_getUri(_endpoints["authenticate"]!),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = AuthenticateResponse.fromJson(jsonDecode(response.body));
      await _setAuthToken(data.token);
      return data.mfaState;
    } else {
      throw Exception("Wrong credentials");
    }
  }

  // Check if current user / session token is still authenticated
  Future<bool> authenticated() async {
    final response = await _client.get(_getUri(_endpoints["authenticated"]!));
    if (response.statusCode == 200) {
      return AuthenticatedResponse.fromJson(jsonDecode(response.body))
          .authenticated;
    } else {
      return false;
    }
  }

  Future<AuthTenantUserResponseDto> currentUser() async {
    final response = await _client.get(_getUri(_endpoints["currentUser"]!));
    if (response.statusCode == 200) {
      return AuthTenantUserResponseDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  Future<List<AuthTenantUserResponseDto>> listUsers() async {
    final response = await _client.get(_getUri(_endpoints["tenantUsers"]!));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((i) => AuthTenantUserResponseDto.fromJson(i))
          .toList();
    } else {
      throw Exception("Error");
    }
  }

  Future<void> commitMfaCode(String mfaCode) async {
    final response = await _client.get(_getUri(_endpoints["authenticated"]!));
    if (response.statusCode == 200) {
      final data = CommitMfaResponse.fromJson(jsonDecode(response.body));
      await AuthService._setMfaToken(data.mfaToken);
    }
  }

  static Future<void> _setAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_AUTH_TOKEN_KEY, token);
  }

  static Future<String> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_AUTH_TOKEN_KEY) ?? "";
  }

  static Future<void> _setMfaToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_MFA_TOKEN_KEY, token);
  }

  static Future<String> getMfaToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_MFA_TOKEN_KEY) ?? "";
  }

  static Future<void> setTenantUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_TENANT_USER_ID_KEY, id);
  }

  static Future<String> getTenantUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_TENANT_USER_ID_KEY) ?? "";
  }

  static Future<void> clearAuthStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_AUTH_TOKEN_KEY);
    await prefs.remove(_MFA_TOKEN_KEY);
    await prefs.remove(_TENANT_USER_ID_KEY);
  }

  Uri _getUri(String path) {
    return Uri.parse("$_baseUrl$path");
  }

  static Future<bool> _hasFullAuthContext() async {
    return !!(await getAuthToken() != "") && !!(await getTenantUserId() != "");
  }
}

enum MfaState {
  DISABLED,
  REQUIRED,
  SETUP,
}

class AuthenticateResponse {
  final MfaState mfaState;
  final String token;

  const AuthenticateResponse({required this.mfaState, required this.token});

  factory AuthenticateResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticateResponse(
        mfaState: MfaState.values.byName(json['mfaState']),
        token: json['token']);
  }
}

class AuthenticatedResponse {
  final bool authenticated;

  const AuthenticatedResponse({required this.authenticated});

  factory AuthenticatedResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticatedResponse(authenticated: json['authenticated']);
  }
}

class CommitMfaResponse {
  final String mfaToken;

  const CommitMfaResponse({required this.mfaToken});

  factory CommitMfaResponse.fromJson(Map<String, dynamic> json) {
    return CommitMfaResponse(mfaToken: json['mfaToken']);
  }
}
