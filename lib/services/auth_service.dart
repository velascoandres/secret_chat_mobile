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

  static final storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;

  static Future<String> get token {
    final storage = new FlutterSecureStorage();
    return storage.read(key: 'token');
  }

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
      await this
          ._guardarToken(loginResponse.accessToken, loginResponse.refreshToken);
    }
    this.autenticando = false;
    return autentificado;
  }

  Future<ReisterReponse> register(
      String username, String email, String password) async {
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
    final decodedResponse = jsonDecode(response.body);
    if (registroOk) {
      final registerResponse =
          ReisterReponse.fromJson(decodedResponse as Map<String, dynamic>);
      this.usuario = registerResponse.user;
      await this._guardarToken(
          registerResponse.accessToken, registerResponse.refreshToken);
      return registerResponse;
    }
    return ReisterReponse(
      error: true,
      statusCode: response.statusCode,
      errors: decodedResponse['errors'],
    );
  }

  Future _guardarToken(String token, String refreshToken) async {
    await storage.write(key: 'refreshToken', value: refreshToken);
    await storage.write(key: 'token', value: token);
    return await storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await storage.delete(key: 'refreshToken');
    return await storage.delete(key: 'token');
  }

  Future<bool> isLoggedIn() async {
    final refreshToken = await storage.read(key: 'refreshToken');
    if (refreshToken == null) return false;
    final data = {
      'refreshToken': refreshToken,
    };
    final response = await http.post(
      '$url/refresh-token',
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final bool refrescadoOK =
        response.statusCode == 200 || response.statusCode == 201;
    this.autenticando = false;
    print(response.statusCode);
    if (refrescadoOK) {
      final registerResponse = LoginResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      this.usuario = registerResponse.user;
      this._guardarToken(
          registerResponse.accessToken, registerResponse.refreshToken);
      return true;
    }
    return false;
  }
}
