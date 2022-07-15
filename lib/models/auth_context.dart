import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:my_app/lib_config.dart';
import 'package:my_app/models/current_user.dart';
import 'package:my_app/utils/auth_graphql_client.dart';
import 'package:my_app/utils/auth_http_client.dart';
import 'package:my_app/utils/auth_service.dart';

class AuthContext extends ChangeNotifier {
  CurrentUser _currentUser = CurrentUser(null);
  late final InterceptedClient _authHttpClient;
  late final GraphQLClient _authGrapQLClient;
  late final AuthService _authService;

  AuthContext() {
    _authHttpClient = AuthHttpClient.create();
    _authGrapQLClient =
        AuthGrapQLClient.create(LibConfig.baseUrl, LibConfig.graphqlEndpoint);
    _authService = AuthService(LibConfig.baseUrl, _authHttpClient, true);

    _authService.checkCurrentUserAuthenticated().then((authenticated) =>
        {if (authenticated) _refreshCurrentUser().then((value) => null)});
  }

  Future<void> login(String username, String password) async {
    await _authService.authenticate(username, password);
    final users = await _authService.listUsers();
    await setTenantUser(users[0].id);
  }

  InterceptedClient getHttpClient() {
    return _authHttpClient;
  }

  GraphQLClient getGraphqlClient() {
    return _authGrapQLClient;
  }

  Future<void> logout() async {
    await AuthService.clearAuthStorage();
    _setCurrentUser(null);
  }

  CurrentUser getCurrentUser() {
    return _currentUser;
  }

  Future<void> switchUser(String id) async {
    await setTenantUser(id);
  }

  Future<void> setTenantUser(String id) async {
    await AuthService.setTenantUserId(id);
    await _refreshCurrentUser();
  }

  /// Pulls current user data from API and refresh local variables
  Future<void> _refreshCurrentUser() async {
    final user = await _authService.currentUser();
    _setCurrentUser(user);
  }

  /// Sets current user and notify all listeners
  void _setCurrentUser(AuthTenantUserResponseDto? user) {
    _currentUser = CurrentUser(user);
    notifyListeners();
  }
}
