import 'dart:convert';

String loginReqToJson(LoginReq data) => json.encode(data.toJson());

class LoginReq {
  String? email;
  String? password;

  LoginReq({
    this.email,
    this.password,
  });

  LoginReq copyWith({
    String? email,
    String? password,
  }) =>
      LoginReq(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory LoginReq.fromJson(Map<String, dynamic> json) => LoginReq(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
