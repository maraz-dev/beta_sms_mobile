import 'package:beta_sms_mobile/data/local/user_data_storage.dart';
import 'package:beta_sms_mobile/data/models/responses/user_profile.dart';

abstract class UserRepository {
  Future<UserResponse> fetchUserProfile();
}

abstract class UserDataStorage implements UserRepository {
  final UserStorageService _service;

  UserDataStorage(this._service);

  @override
  Future<UserResponse> fetchUserProfile() async => _service.getUser();
}
