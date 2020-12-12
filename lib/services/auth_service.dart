import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:secret_chat_mobile/global/environment.dart';
import 'package:secret_chat_mobile/models/login_response.dart';
import 'package:secret_chat_mobile/models/usuario.dart';

class AuthService with ChangeNotifier {
  Usuario usuario;

  final String url = '${Environment.domain}/auth';

  Future login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };
    final response = await http.post(
      '$url/login',
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      final loginResponse =
          LoginResponse.fromJson(response.body as Map<String, dynamic>);
      this.usuario = loginResponse.user;
    }
  }
}
