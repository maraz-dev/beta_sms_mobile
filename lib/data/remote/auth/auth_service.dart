import 'package:beta_sms_mobile/core/http/http_service.dart';
import 'package:beta_sms_mobile/core/storage/hive-storage/hive_storage.dart';
import 'package:beta_sms_mobile/core/storage/hive-storage/hive_storage_service.dart';
import 'package:beta_sms_mobile/core/storage/secure-storage/secure_storage.dart';
import 'package:beta_sms_mobile/core/storage/share_pref.dart';
import 'package:beta_sms_mobile/core/utils/app_url.dart';
import 'package:beta_sms_mobile/data/models/requests/create_account_req.dart';
import 'package:beta_sms_mobile/data/models/requests/login_req.dart';
import 'package:beta_sms_mobile/data/models/responses/user_profile.dart';
import 'package:dio/dio.dart';

class AuthService {
  final HttpService _networkService;
  final SecureStorageBase _storage;
  final HiveStorageBase _hivestorage;

  AuthService(
      {required HttpService networkService,
      required SecureStorageBase storage,
      required HiveStorageBase hivestorage})
      : _networkService = networkService,
        _storage = storage,
        _hivestorage = hivestorage;

  final endpointUrl = ApiEndpoints.instance;

  Future<String> login(LoginReq loginReq) async {
    try {
      final response = await _networkService.request(
          endpointUrl.login, RequestMethod.post,
          data: loginReq.toJson());

      final res = response.data["data"];
      final tokenRes = Token.fromJson(res["token"]);
      _storage.saveData('token', tokenRes.token ?? '');
      SharedPrefManager.userId = res['id'];
      SharedPrefManager.accountStatus = res['status'];
      _hivestorage.set(StorageKey.userProfile.name, res);

      return response.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> createAccount(CreateAccountReq createAccountReq) async {
    try {
      final response = await _networkService.request(
        endpointUrl.createAccount,
        RequestMethod.post,
        data: createAccountReq.toJson(),
        options: Options(
          headers: {
            'x-partner': '62a4529a-e52c-4ea3-8c35-09e0782dc0f9',
          },
        ),
      );

      return response.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> sendOTP(String email) async {
    try {
      final response = await _networkService.request(
        endpointUrl.sendOtp,
        RequestMethod.post,
        data: {"email": email},
      );

      return response.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> validateOTP(String email, String otp) async {
    try {
      final response = await _networkService.request(
        endpointUrl.validateOtp,
        RequestMethod.post,
        data: {
          "email": email,
          "otp": otp,
        },
      );

      return response.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }
}
