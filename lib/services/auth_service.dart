import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:secret_chat_mobile/global/environment.dart';
import 'package:secret_chat_mobile/models/login_response.dart';
import 'package:secret_chat_mobile/models/usuario.dart';

class AuthService with ChangeNotifier {
  Usuario usuario;
  bool _autenticando = false;

  final String url = '${Environment.domain}/auth';

  bool get autenticando => this._autenticando;

  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {
      'email': email,
      'password': password,
    };
    final response = await http.post(
      '$url/login',
      body: json.encode(data),
    );
    print(response.body);
    final bool autentificado = response.statusCode == 200;
    if (autentificado) {
      final loginResponse =
          LoginResponse.fromJson(response.body as Map<String, dynamic>);
      this.usuario = loginResponse.user;
    }
    this.autenticando = false;
    return autentificado;
  }
}
