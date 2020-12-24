import 'package:secret_chat_mobile/library/principal_model.dart';

class Usuario extends PrincipalModel {
  bool online;
  String email;
  String username;

  Usuario({
    this.online,
    this.email,
    this.username,
    String id,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt);

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        username: json["username"],
        id: json["id"],
        email: json["email"],
        online: json["online"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "email": email,
      };
}
