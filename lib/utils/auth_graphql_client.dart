import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_app/utils/auth_service.dart';

class AuthGrapQLClient {
  static GraphQLClient create(final String baseUrl, final String endpoint) {
    final HttpLink httpLink = HttpLink(
      "$baseUrl/$endpoint",
    );

    final AuthLink authTokenLink = AuthLink(
        getToken: () async => AuthService.getAuthTokenHeader(),
        headerKey: "x-auth-token");

    final AuthLink tenantUserLink = AuthLink(
        getToken: () async => AuthService.getTenantUserId(),
        headerKey: "x-tenant-user-id");

    final Link link = Link.from([authTokenLink, tenantUserLink, httpLink]);

    return GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(),
    );
  }
}
