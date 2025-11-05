import 'package:dio/dio.dart';
import 'package:ride_hailing/services/services.dart';
import 'package:ride_hailing/utils/utils.dart';

class UserApi {
  final HttpService httpService;

  UserApi(this.httpService);

  Future<HttpServiceResponse<Map<String, dynamic>>> updateProfilePicture(
    FormData formData,
  ) async {
    return await httpService.post<Map<String, dynamic>>(
      'update-profile-picture',
      body: formData,
    );
  }

  Future<HttpServiceResponse<Map<String, dynamic>>> updateUser({
    String? dob,
    String? gender,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) async {
    return await httpService.post<Map<String, dynamic>>(
      'update-profile',
      body: filterNonNullAndNonZero({
        'dob': dob,
        'gender': gender,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
      }),
    );
  }

  Future<HttpServiceResponse<Map<String, dynamic>>> getUser() async {
    return await httpService.get<Map<String, dynamic>>(
      'get-authenticated-user',
    );
  }
}
