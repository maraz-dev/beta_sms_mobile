class TransactionItem {
  String? userId;
  String? walletId;
  String? description;
  String? type;
  double? amount;
  String? reference;
  String? status;
  String? vendorName;
  String? vendorReference;
  double? balanceBefore;
  double? balanceAfter;
  String? id;
  DateTime? dateCreated;
  DateTime? dateLastModified;

  TransactionItem({
    this.userId,
    this.walletId,
    this.description,
    this.type,
    this.amount,
    this.reference,
    this.status,
    this.vendorName,
    this.vendorReference,
    this.balanceBefore,
    this.balanceAfter,
    this.id,
    this.dateCreated,
    this.dateLastModified,
  });

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      TransactionItem(
        userId: json["userId"],
        walletId: json["walletId"],
        description: json["description"],
        type: json["type"],
        amount: json["amount"].toDouble(),
        reference: json["reference"],
        status: json["status"],
        vendorName: json["vendorName"],
        vendorReference: json["vendorReference"],
        balanceBefore: json["balanceBefore"].toDouble(),
        balanceAfter: json["balanceAfter"].toDouble(),
        id: json["id"],
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
        dateLastModified: json["dateLastModified"] == null
            ? null
            : DateTime.parse(json["dateLastModified"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "walletId": walletId,
        "description": description,
        "type": type,
        "amount": amount,
        "reference": reference,
        "status": status,
        "vendorName": vendorName,
        "vendorReference": vendorReference,
        "balanceBefore": balanceBefore,
        "balanceAfter": balanceAfter,
        "id": id,
        "dateCreated": dateCreated?.toIso8601String(),
        "dateLastModified": dateLastModified?.toIso8601String(),
      };
}
