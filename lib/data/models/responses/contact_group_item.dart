class ContactGroupItem {
  String? name;
  String? createdBy;
  String? id;
  DateTime? dateCreated;
  DateTime? dateLastModified;

  ContactGroupItem({
    this.name,
    this.createdBy,
    this.id,
    this.dateCreated,
    this.dateLastModified,
  });

  factory ContactGroupItem.fromJson(Map<String, dynamic> json) =>
      ContactGroupItem(
        name: json["name"],
        createdBy: json["createdBy"],
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
        "createdBy": createdBy,
        "id": id,
        "dateCreated": dateCreated?.toIso8601String(),
        "dateLastModified": dateLastModified?.toIso8601String(),
      };
}
