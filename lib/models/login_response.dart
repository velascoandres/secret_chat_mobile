import 'package:secret_chat_mobile/models/usuario.dart';


class LoginResponse {
    LoginResponse({
        this.accessToken,
        this.refreshToken,
        this.user,
    });

    String accessToken;
    String refreshToken;
    Usuario user;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        user: Usuario.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "user": user.toJson(),
    };
}

