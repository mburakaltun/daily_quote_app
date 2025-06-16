import 'package:daily_quote_app/common/service/api_service.dart';
import 'package:daily_quote_app/profile/model/endpoint/user_endpoints.dart';
import 'package:daily_quote_app/profile/model/request/request_change_username.dart';
import 'package:daily_quote_app/profile/model/response/response_change_username.dart';

import '../model/request/request_change_password.dart';
import '../model/response/response_change_password.dart';
import '../model/response/response_delete_user.dart';
import '../model/response/response_get_profile.dart';

class UserService {
  final ApiService _apiService = ApiService();

  Future<ResponseGetProfile> getProfile() async {
    final responseData = await _apiService.get(endpoint: UserEndpoints.getProfile);
    return ResponseGetProfile.fromJson(responseData!);
  }

  Future<ResponseChangeUsername> changeUsername(RequestChangeUsername request) async {
    final responseData = await _apiService.put(endpoint: UserEndpoints.changeUsername, body: request.toJson());
    return ResponseChangeUsername.fromJson(responseData!);
  }

  Future<ResponseChangePassword> changePassword(RequestChangePassword request) async {
    final responseData = await _apiService.put(endpoint: UserEndpoints.changePassword, body: request.toJson());
    return ResponseChangePassword.fromJson(responseData!);
  }

  Future<ResponseDeleteUser> deleteUser() async {
    final responseData = await _apiService.delete(endpoint: UserEndpoints.deleteUser);
    return ResponseDeleteUser.fromJson(responseData!);
  }
}
