import 'package:beta_sms_mobile/data/models/responses/user_profile.dart';
import 'package:hive_flutter/adapters.dart';

class UserProfileAdapter extends TypeAdapter<UserResponse> {
  @override
  final int typeId = 0; // Unique identifier for this class

  @override
  UserResponse read(BinaryReader reader) {
    final fields = reader.readMap();
    return UserResponse.fromJson(Map<String, dynamic>.from(fields));
  }

  @override
  void write(BinaryWriter writer, UserResponse obj) {
    writer.writeMap(obj.toJson());
  }
}
