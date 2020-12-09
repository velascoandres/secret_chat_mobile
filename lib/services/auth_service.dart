import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:secret_chat_mobile/global/environment.dart';

class AuthService with ChangeNotifier {
  // final usuario;

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

    print(response.body);
  }
}
