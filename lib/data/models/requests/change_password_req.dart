import 'dart:convert';

String changePasswordReqToJson(ChangePasswordReq data) =>
    json.encode(data.toJson());

class ChangePasswordReq {
  String? currentPassword;
  String? newPassword;
  String? confirmNewPassword;

  ChangePasswordReq({
    this.currentPassword,
    this.newPassword,
    this.confirmNewPassword,
  });

  ChangePasswordReq copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmNewPassword,
  }) =>
      ChangePasswordReq(
        currentPassword: currentPassword ?? this.currentPassword,
        newPassword: newPassword ?? this.newPassword,
        confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
      );

  factory ChangePasswordReq.fromJson(Map<String, dynamic> json) =>
      ChangePasswordReq(
        currentPassword: json["currentPassword"],
        newPassword: json["newPassword"],
        confirmNewPassword: json["confirmNewPassword"],
      );

  Map<String, dynamic> toJson() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "confirmNewPassword": confirmNewPassword,
      };
}
