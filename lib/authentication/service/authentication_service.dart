import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/shared_preferences_key.dart';
import '../../common/service/api_service.dart';
import '../model/endpoint/authentication_endpoints.dart';
import '../model/request/request_complete_reset_password.dart';
import '../model/request/request_sign_in_user.dart';
import '../model/request/request_sign_up_user.dart';
import '../model/request/request_start_reset_password.dart';
import '../model/response/response_complete_reset_password.dart';
import '../model/response/response_start_reset_password.dart';
import '../model/response/response_sign_in_user.dart';

class AuthenticationService {
  final ApiService _apiService;

  AuthenticationService() : _apiService = ApiService();

  Future<void> signUp(RequestSignUpUser request) async {
    await _apiService.post(
      endpoint: AuthEndpoints.signUp,
      body: request.toJson(),
    );
  }

  Future<void> signIn(RequestSignInUser request) async {
    final response = await _apiService.post(
      endpoint: AuthEndpoints.signIn,
      body: request.toJson(),
    );

    ResponseSignInUser responseSignInUser = ResponseSignInUser.fromJson(response!);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPreferencesKey.authToken, responseSignInUser.authenticationToken);
    await prefs.setString(SharedPreferencesKey.userId, responseSignInUser.userId);
    await prefs.setString(SharedPreferencesKey.username, responseSignInUser.username);
  }

  Future<ResponseStartResetPassword> startResetPassword(RequestStartResetPassword request) async {
    await _apiService.post(
      endpoint: AuthEndpoints.startResetPassword,
      body: request.toJson(),
    );
    return ResponseStartResetPassword();
  }

  Future<ResponseCompleteResetPassword> completeResetPassword(RequestCompleteResetPassword request) async {
    final response = await _apiService.post(
      endpoint: AuthEndpoints.completeResetPassword,
      body: request.toJson(),
    );
    return ResponseCompleteResetPassword.fromJson(response!);
  }
}
