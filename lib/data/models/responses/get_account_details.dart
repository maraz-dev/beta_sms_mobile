// To parse this JSON data, do
//
//     final getAccountDetails = getAccountDetailsFromJson(jsonString);

import 'dart:convert';

GetAccountDetails getAccountDetailsFromJson(String str) =>
    GetAccountDetails.fromJson(json.decode(str));

String getAccountDetailsToJson(GetAccountDetails data) =>
    json.encode(data.toJson());

class GetAccountDetails {
  String? fullName;
  String? email;
  String? phoneNumber;

  GetAccountDetails({
    this.fullName,
    this.email,
    this.phoneNumber,
  });

  factory GetAccountDetails.fromJson(Map<String, dynamic> json) =>
      GetAccountDetails(
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
