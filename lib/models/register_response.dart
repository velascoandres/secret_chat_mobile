import 'package:secret_chat_mobile/models/usuario.dart';

import 'login_response.dart';

class ReisterReponse extends LoginResponse {
  int statusCode;
  bool error = false;
  Map<String, dynamic> errors;

  ReisterReponse({
    this.statusCode,
    this.error,
    this.errors,
    String accessToken,
    String refreshToken,
    Usuario user,
  }) : super(accessToken: accessToken, refreshToken: refreshToken, user: user);

  factory ReisterReponse.fromJson(Map<String, dynamic> json) {
    return ReisterReponse(
      error: json['error'],
      statusCode: json['statusCode'],
      errors: json['errors'],
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
      user: Usuario.fromJson(json['user']),
    );
  }
}
