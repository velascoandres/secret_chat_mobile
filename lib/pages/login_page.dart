import 'package:flutter/material.dart';

import 'package:secret_chat_mobile/colors/colors.dart';
import 'package:secret_chat_mobile/forms/login_form.dart';
import 'package:secret_chat_mobile/widgets/labels.dart';
import 'package:secret_chat_mobile/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GRAY),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Logo(),
            LoginForm(),
            Labels(),
            Text(
              'Términos y condiciones de uso',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
