import 'package:http_interceptor/http_interceptor.dart';
import 'package:my_app/utils/auth_service.dart';

class AuthHttpClient {
  static InterceptedClient create() {
    return InterceptedClient.build(interceptors: [
      AuthInterceptor(),
    ]);
  }
}

class AuthInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    final authToken = await AuthService.getAuthToken();
    final mfaToken = await AuthService.getMfaToken();
    final tenantUserId = await AuthService.getTenantUserId();

    if (authToken != "") {
      data.headers.putIfAbsent("x-auth-token",
          () => mfaToken != "" ? "${authToken}_$mfaToken" : authToken);
    }

    if (tenantUserId != "") {
      data.headers.putIfAbsent("x-tenant-user-id", () => tenantUserId);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode > 299) {
      print("interceptor: Something went wrong");
    }
    return data;
  }
}
