class Balance {
  double? balance;
  double? unit;

  Balance({
    this.balance,
    this.unit,
  });

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        balance: json["balance"].toDouble(),
        unit: json["unit"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "unit": unit,
      };
}
