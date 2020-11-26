import 'package:flutter/material.dart';

import 'package:secret_chat_mobile/widgets/widgets_index.dart';


class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailTextController = new TextEditingController();
  final TextEditingController passwordTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
      ),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInputField(
            hint: 'Email',
            prefixIcon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
            textEditingController: emailTextController,
          ),
          CustomInputField(
            hint: 'Password',
            prefixIcon: Icons.security,
            obscure: true,
            textEditingController: passwordTextController,
          ),
          RaisedButton(
            child: Text('Ingresar'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
