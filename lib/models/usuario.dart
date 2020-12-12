class Usuario {
  bool online;
  String email;
  String nombre;
  String uid;
  String username;
  String id;

  Usuario({
    this.online,
    this.email,
    this.nombre,
    this.uid,
    this.username,
    this.id
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        username: json["username"],
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "email": email,
      };
}
