import 'package:ride_hailing/services/services.dart';
import 'package:ride_hailing/stores/auth/model.dart';

class AuthApi {
  final HttpService httpService;

  AuthApi(this.httpService);

  /// Login user.
  Future<HttpServiceResponse<AuthModel>> login({
    required String email,
    required String password,
  }) async {
    return await httpService.post<AuthModel>(
      'auth/login',
      body: {
        'email': email,
        'password': password,
      },
      transformer: (data) => AuthModel.fromMap(data),
    );
  }

  /// Register user.
  Future<HttpServiceResponse<AuthModel>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? phoneNumber,
    required String passwordConfirmation,
    String? typeString,
  }) async {
    return await httpService.post<AuthModel>(
      'auth/register',
      body: {
        'email': email,
        'password': password,
        'last_name': lastName,
        'first_name': firstName,
        'phone_number': phoneNumber,
        'password_confirmation': passwordConfirmation,
      },
      transformer: (data) => AuthModel.fromMap(data),
    );
  }

  /// Firebase auth user.
  Future<HttpServiceResponse<AuthModel>> firebaseSocialAuth({
    required String idToken,
    required String provider,
  }) async {
    return await httpService.post<AuthModel>(
      'auth/firebase-social/login',
      body: {
        'id_token': idToken,
        'provider': provider,
      },
      transformer: (data) {
        // print({data});
        return AuthModel.fromMap(data);
      },
    );
  }

  /// Logout user.
  Future<HttpServiceResponse<Map<String, dynamic>>> logout() async {
    return await httpService.delete<Map<String, dynamic>>('auth/logout');
  }

  Future<HttpServiceResponse<Map<String, dynamic>>> deleteAccount() async {
    return await httpService.post<Map<String, dynamic>>('delete-account');
  }
}
