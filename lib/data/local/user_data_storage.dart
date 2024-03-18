import 'package:beta_sms_mobile/core/storage/hive-storage/hive_storage.dart';
import 'package:beta_sms_mobile/core/storage/hive-storage/hive_storage_service.dart';
import 'package:beta_sms_mobile/data/models/responses/user_profile.dart';

class UserStorageService {
  final HiveStorageBase _storageService;

  UserStorageService({required HiveStorageBase storageService})
      : _storageService = storageService;

  Future<UserResponse> getUser() async {
    try {
      final result = await _storageService.get(StorageKey.userProfile.name);
      print("RESULT ----------->>> $result");

      if (result != null) {
        return result;
      } else {
        return UserResponse();
      }
    } catch (e) {
      print("This is Storage Error " + e.toString());
      throw e.toString();
    }
  }
}
