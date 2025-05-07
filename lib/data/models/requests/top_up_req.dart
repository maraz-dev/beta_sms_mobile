import 'dart:convert';

String topUpReqToJson(TopUpReq data) => json.encode(data.toJson());

class TopUpReq {
  int? amount;
  String? cardNumber;
  int? cardCvv;
  int? cardExpiryMonth;
  int? cardExpiryYear;

  TopUpReq({
    this.amount,
    this.cardNumber,
    this.cardCvv,
    this.cardExpiryMonth,
    this.cardExpiryYear,
  });

  TopUpReq copyWith({
    int? amount,
    String? cardNumber,
    int? cardCvv,
    int? cardExpiryMonth,
    int? cardExpiryYear,
  }) =>
      TopUpReq(
        amount: amount ?? this.amount,
        cardNumber: cardNumber ?? this.cardNumber,
        cardCvv: cardCvv ?? this.cardCvv,
        cardExpiryMonth: cardExpiryMonth ?? this.cardExpiryMonth,
        cardExpiryYear: cardExpiryYear ?? this.cardExpiryYear,
      );

  factory TopUpReq.fromJson(Map<String, dynamic> json) => TopUpReq(
        amount: json["amount"],
        cardNumber: json["cardNumber"],
        cardCvv: json["cardCvv"],
        cardExpiryMonth: json["cardExpiryMonth"],
        cardExpiryYear: json["cardExpiryYear"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "cardNumber": cardNumber,
        "cardCvv": cardCvv,
        "cardExpiryMonth": cardExpiryMonth,
        "cardExpiryYear": cardExpiryYear,
      };
}
