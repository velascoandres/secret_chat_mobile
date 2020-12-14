import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:secret_chat_mobile/global/environment.dart';
import 'package:secret_chat_mobile/models/login_response.dart';
import 'package:secret_chat_mobile/models/register_response.dart';
import 'package:secret_chat_mobile/models/usuario.dart';

class AuthService with ChangeNotifier {
  Usuario usuario;
  bool _autenticando = false;

  final String url = '${Environment.domain}/auth';

  final storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;

  get token => this.storage.read(key: 'token');

  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {
      'username': email,
      'email': email,
      'password': password,
    };
    final response =
        await http.post('$url/login', body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });
    final bool autentificado =
        response.statusCode == 200 || response.statusCode == 201;
    if (autentificado) {
      final loginResponse = LoginResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      this.usuario = loginResponse.user;
      this._guardarToken(loginResponse.accessToken);
    }
    this.autenticando = false;
    return autentificado;
  }

  Future<ReisterReponse> register(String username, String email, String password) async {
    this.autenticando = true;

    final data = {
      'username': username,
      'email': email,
      'password': password,
    };
    final response = await http
        .post('$url/register-login', body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    final bool registroOk =
        response.statusCode == 200 || response.statusCode == 201;
    this.autenticando = false;
    final registerResponse = ReisterReponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    if (registroOk) {
      this.usuario = registerResponse.user;
      this._guardarToken(registerResponse.accessToken);
    }
    return registerResponse;
  }

  Future _guardarToken(String token) async {
    return await this.storage.write(key: 'token', value: token);
  }

  Future logout() async {
    return await this.storage.delete(key: 'token');
  }
}
