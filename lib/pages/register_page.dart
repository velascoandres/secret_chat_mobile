import 'package:flutter/material.dart';

import 'package:secret_chat_mobile/forms/register_form.dart';
import 'package:secret_chat_mobile/widgets/widgets_index.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(GRAY),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Logo(
                  titulo: 'Registro',
                ),
                RegisterForm(),
                Labels(
                  tapTitle: 'Regresar a login',
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, 'login'),
                ),
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
        ),
      ),
    );
  }
}
