import 'package:flutter/material.dart';

import 'package:secret_chat_mobile/widgets/widgets_index.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailTextController = new TextEditingController();
  final TextEditingController nombreTextController =
      new TextEditingController();
  final TextEditingController passwordTextController =
      new TextEditingController();

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
            hint: 'Nombre',
            prefixIcon: Icons.perm_identity,
            textEditingController: nombreTextController,
          ),
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
          BotonAzul(
            titulo: 'Ingresar',
            onPressed: () {
              print('Valores: ');
              print(this.emailTextController.value);
              print(this.passwordTextController.value);
            },
          )
        ],
      ),
    );
  }
}
