class PrincipalModel {
  PrincipalModel({
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;

  static fromJson(Map<String, dynamic> json) => PrincipalModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
