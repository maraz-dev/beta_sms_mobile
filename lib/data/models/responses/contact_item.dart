class ContactItem {
  String? name;
  String? phoneNumber;
  String? network;
  String? email;
  String? contactGroupId;
  String? id;
  DateTime? dateCreated;
  DateTime? dateLastModified;

  ContactItem({
    this.name,
    this.phoneNumber,
    this.network,
    this.email,
    this.contactGroupId,
    this.id,
    this.dateCreated,
    this.dateLastModified,
  });

  factory ContactItem.fromJson(Map<String, dynamic> json) => ContactItem(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        network: json["network"],
        email: json["email"],
        contactGroupId: json["contactGroupId"],
        id: json["id"],
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
        dateLastModified: json["dateLastModified"] == null
            ? null
            : DateTime.parse(json["dateLastModified"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "network": network,
        "email": email,
        "contactGroupId": contactGroupId,
        "id": id,
        "dateCreated": dateCreated?.toIso8601String(),
        "dateLastModified": dateLastModified?.toIso8601String(),
      };
}
