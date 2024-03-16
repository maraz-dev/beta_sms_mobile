// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  String? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? phoneNumber;
  String? status;
  String? roleCode;
  String? referalCode;
  String? userReferalCode;
  String? country;
  bool? isPinSet;
  String? bankName;
  bool? isKycCompleted;
  Token? token;
  String? tokenType;
  String? agentCode;
  bool? isEmailConfirmed;
  bool? isPhoneNumberConfirmed;
  String? lga;
  String? address;
  String? state;
  bool? isSecurityQuestionSet;
  bool? isPushNotificationSet;
  bool? isDeviceTokenValidated;
  bool? isDefaultPassword;
  String? tierCode;
  bool? isKycSentToThirdParty;
  PartnerWallet? partnerWallet;

  UserResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.phoneNumber,
    this.status,
    this.roleCode,
    this.referalCode,
    this.userReferalCode,
    this.country,
    this.isPinSet,
    this.bankName,
    this.isKycCompleted,
    this.token,
    this.tokenType,
    this.agentCode,
    this.isEmailConfirmed,
    this.isPhoneNumberConfirmed,
    this.lga,
    this.address,
    this.state,
    this.isSecurityQuestionSet,
    this.isPushNotificationSet,
    this.isDeviceTokenValidated,
    this.isDefaultPassword,
    this.tierCode,
    this.isKycSentToThirdParty,
    this.partnerWallet,
  });

  UserResponse copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? phoneNumber,
    String? status,
    String? roleCode,
    String? referalCode,
    String? userReferalCode,
    String? country,
    bool? isPinSet,
    String? bankName,
    bool? isKycCompleted,
    Token? token,
    String? tokenType,
    String? agentCode,
    bool? isEmailConfirmed,
    bool? isPhoneNumberConfirmed,
    String? lga,
    String? address,
    String? state,
    bool? isSecurityQuestionSet,
    bool? isPushNotificationSet,
    bool? isDeviceTokenValidated,
    bool? isDefaultPassword,
    String? tierCode,
    bool? isKycSentToThirdParty,
    PartnerWallet? partnerWallet,
  }) =>
      UserResponse(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        status: status ?? this.status,
        roleCode: roleCode ?? this.roleCode,
        referalCode: referalCode ?? this.referalCode,
        userReferalCode: userReferalCode ?? this.userReferalCode,
        country: country ?? this.country,
        isPinSet: isPinSet ?? this.isPinSet,
        bankName: bankName ?? this.bankName,
        isKycCompleted: isKycCompleted ?? this.isKycCompleted,
        token: token ?? this.token,
        tokenType: tokenType ?? this.tokenType,
        agentCode: agentCode ?? this.agentCode,
        isEmailConfirmed: isEmailConfirmed ?? this.isEmailConfirmed,
        isPhoneNumberConfirmed:
            isPhoneNumberConfirmed ?? this.isPhoneNumberConfirmed,
        lga: lga ?? this.lga,
        address: address ?? this.address,
        state: state ?? this.state,
        isSecurityQuestionSet:
            isSecurityQuestionSet ?? this.isSecurityQuestionSet,
        isPushNotificationSet:
            isPushNotificationSet ?? this.isPushNotificationSet,
        isDeviceTokenValidated:
            isDeviceTokenValidated ?? this.isDeviceTokenValidated,
        isDefaultPassword: isDefaultPassword ?? this.isDefaultPassword,
        tierCode: tierCode ?? this.tierCode,
        isKycSentToThirdParty:
            isKycSentToThirdParty ?? this.isKycSentToThirdParty,
        partnerWallet: partnerWallet ?? this.partnerWallet,
      );

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        status: json["status"],
        roleCode: json["roleCode"],
        referalCode: json["referalCode"],
        userReferalCode: json["userReferalCode"],
        country: json["country"],
        isPinSet: json["isPINSet"],
        bankName: json["bankName"],
        isKycCompleted: json["isKycCompleted"],
        token: json["token"] == null ? null : Token.fromJson(json["token"]),
        tokenType: json["tokenType"],
        agentCode: json["agentCode"],
        isEmailConfirmed: json["isEmailConfirmed"],
        isPhoneNumberConfirmed: json["isPhoneNumberConfirmed"],
        lga: json["lga"],
        address: json["address"],
        state: json["state"],
        isSecurityQuestionSet: json["isSecurityQuestionSet"],
        isPushNotificationSet: json["isPushNotificationSet"],
        isDeviceTokenValidated: json["isDeviceTokenValidated"],
        isDefaultPassword: json["isDefaultPassword"],
        tierCode: json["tierCode"],
        isKycSentToThirdParty: json["isKycSentToThirdParty"],
        partnerWallet: json["partnerWallet"] == null
            ? null
            : PartnerWallet.fromJson(json["partnerWallet"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "status": status,
        "roleCode": roleCode,
        "referalCode": referalCode,
        "userReferalCode": userReferalCode,
        "country": country,
        "isPINSet": isPinSet,
        "bankName": bankName,
        "isKycCompleted": isKycCompleted,
        "token": token?.toJson(),
        "tokenType": tokenType,
        "agentCode": agentCode,
        "isEmailConfirmed": isEmailConfirmed,
        "isPhoneNumberConfirmed": isPhoneNumberConfirmed,
        "lga": lga,
        "address": address,
        "state": state,
        "isSecurityQuestionSet": isSecurityQuestionSet,
        "isPushNotificationSet": isPushNotificationSet,
        "isDeviceTokenValidated": isDeviceTokenValidated,
        "isDefaultPassword": isDefaultPassword,
        "tierCode": tierCode,
        "isKycSentToThirdParty": isKycSentToThirdParty,
        "partnerWallet": partnerWallet?.toJson(),
      };
}

class PartnerWallet {
  String? accountNumber;
  String? userId;
  int? balance;
  bool? isLien;
  int? lienAmount;
  String? id;
  DateTime? dateCreated;
  DateTime? dateLastModified;

  PartnerWallet({
    this.accountNumber,
    this.userId,
    this.balance,
    this.isLien,
    this.lienAmount,
    this.id,
    this.dateCreated,
    this.dateLastModified,
  });

  PartnerWallet copyWith({
    String? accountNumber,
    String? userId,
    int? balance,
    bool? isLien,
    int? lienAmount,
    String? id,
    DateTime? dateCreated,
    DateTime? dateLastModified,
  }) =>
      PartnerWallet(
        accountNumber: accountNumber ?? this.accountNumber,
        userId: userId ?? this.userId,
        balance: balance ?? this.balance,
        isLien: isLien ?? this.isLien,
        lienAmount: lienAmount ?? this.lienAmount,
        id: id ?? this.id,
        dateCreated: dateCreated ?? this.dateCreated,
        dateLastModified: dateLastModified ?? this.dateLastModified,
      );

  factory PartnerWallet.fromJson(Map<String, dynamic> json) => PartnerWallet(
        accountNumber: json["accountNumber"],
        userId: json["userId"],
        balance: json["balance"],
        isLien: json["isLien"],
        lienAmount: json["lienAmount"],
        id: json["id"],
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
        dateLastModified: json["dateLastModified"] == null
            ? null
            : DateTime.parse(json["dateLastModified"]),
      );

  Map<String, dynamic> toJson() => {
        "accountNumber": accountNumber,
        "userId": userId,
        "balance": balance,
        "isLien": isLien,
        "lienAmount": lienAmount,
        "id": id,
        "dateCreated": dateCreated?.toIso8601String(),
        "dateLastModified": dateLastModified?.toIso8601String(),
      };
}

class Token {
  String? token;
  String? refreshToken;
  DateTime? refreshTokenExpiryTime;

  Token({
    this.token,
    this.refreshToken,
    this.refreshTokenExpiryTime,
  });

  Token copyWith({
    String? token,
    String? refreshToken,
    DateTime? refreshTokenExpiryTime,
  }) =>
      Token(
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
        refreshTokenExpiryTime:
            refreshTokenExpiryTime ?? this.refreshTokenExpiryTime,
      );

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        refreshToken: json["refreshToken"],
        refreshTokenExpiryTime: json["refreshTokenExpiryTime"] == null
            ? null
            : DateTime.parse(json["refreshTokenExpiryTime"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "refreshTokenExpiryTime": refreshTokenExpiryTime?.toIso8601String(),
      };
}
