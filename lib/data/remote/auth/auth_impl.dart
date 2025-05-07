import 'package:beta_sms_mobile/data/models/requests/create_account_req.dart';
import 'package:beta_sms_mobile/data/models/requests/login_req.dart';
import 'package:beta_sms_mobile/data/remote/auth/auth_service.dart';

abstract class AuthRepository {
  Future<String> login(LoginReq loginReq);
  Future<String> createAccount(CreateAccountReq createAccountReq);
  Future<String> sendOTP(String email);
  Future<String> validateOTP(String email, String otp);
}

class AuthImpl implements AuthRepository {
  final AuthService _authService;

  AuthImpl(this._authService);

  @override
  Future<String> login(LoginReq loginReq) async =>
      await _authService.login(loginReq);

  @override
  Future<String> createAccount(CreateAccountReq createAccountReq) async =>
      await _authService.createAccount(createAccountReq);

  @override
  Future<String> sendOTP(String email) async =>
      await _authService.sendOTP(email);

  @override
  Future<String> validateOTP(String email, String otp) async =>
      await _authService.validateOTP(email, otp);
}
