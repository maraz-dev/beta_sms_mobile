import 'package:beta_sms_mobile/data/models/requests/login_req.dart';
import 'package:beta_sms_mobile/data/remote/auth/auth_service.dart';

abstract class AuthRepository {
  Future<String> login(LoginReq loginReq);
}

class AuthImpl implements AuthRepository {
  final AuthService _authService;

  AuthImpl(this._authService);

  @override
  Future<String> login(LoginReq loginReq) async => _authService.login(loginReq);
}
