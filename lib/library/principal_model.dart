import 'package:secret_chat_mobile/library/serializable_model.dart';

class PrincipalModel extends DeserializableModel {
  PrincipalModel({
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String createdAt;
  String updatedAt;

  static PrincipalModel fromJson(Map<String, dynamic> json) => PrincipalModel(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
    };
  }
}
