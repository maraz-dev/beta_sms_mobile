import 'dart:convert';

String loginReqToJson(CreateAccountReq data) => json.encode(data.toJson());

class CreateAccountReq {
  String? fullName;
  String? confirmName;
  String? emailAddress;
  String? phoneNumber;
  String? password;
  DateTime? dateOfBirth;
  String? referalCode;
  String? roleName;

  CreateAccountReq({
    this.fullName,
    this.confirmName,
    this.emailAddress,
    this.phoneNumber,
    this.password,
    this.dateOfBirth,
    this.referalCode,
    this.roleName,
  });

  CreateAccountReq copyWith({
    String? fullName,
    String? confirmName,
    String? emailAddress,
    String? phoneNumber,
    String? password,
    DateTime? dateOfBirth,
    String? referalCode,
    String? roleName,
  }) =>
      CreateAccountReq(
        fullName: fullName ?? this.fullName,
        confirmName: confirmName ?? this.confirmName,
        emailAddress: emailAddress ?? this.emailAddress,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        referalCode: referalCode ?? this.referalCode,
        roleName: roleName ?? this.roleName,
      );

  factory CreateAccountReq.fromJson(Map<String, dynamic> json) =>
      CreateAccountReq(
        fullName: json["fullName"],
        confirmName: json["confirmName"],
        emailAddress: json["emailAddress"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        referalCode: json["referalCode"],
        roleName: json["roleName"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "confirmName": confirmName,
        "emailAddress": emailAddress,
        "phoneNumber": phoneNumber,
        "password": password,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "referalCode": referalCode,
        "roleName": roleName,
      };
}
