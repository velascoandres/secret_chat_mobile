import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret_chat_mobile/helpers/mostrar_alerta.dart';
import 'package:secret_chat_mobile/models/register_response.dart';
import 'package:secret_chat_mobile/services/auth_service.dart';
import 'package:secret_chat_mobile/services/socket_service.dart';

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
    final authService = Provider.of<AuthService>(context, listen: true);
    final SocketService socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 40,
      ),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInputField(
            hint: 'Username',
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
            onPressed:
                this._manejarRegistro(context, authService, socketService),
          ),
        ],
      ),
    );
  }

  Function _manejarRegistro(BuildContext context, AuthService authService,
      SocketService socketService) {
    if (authService.autenticando) return null;
    return () async {
      FocusScope.of(context).unfocus();
      final email = this.emailTextController.text;
      final password = this.passwordTextController.text;
      final username = this.nombreTextController.text;
      final ReisterReponse registroOk =
          await authService.register(username, email, password);
      if (registroOk.user != null) {
        // Navegar a la otra pantalla
        socketService.connect();
        Navigator.pushReplacementNamed(context, 'usuarios');
      } else {
        mostrarAlerta(context, 'Registro incorrecto',
            this.obtenerDetalleError(registroOk.errors));
      }
    };
  }

  obtenerDetalleError(Map<String, dynamic> error) {
    final List<dynamic> detallesError = error.values.toList();
    return detallesError.join('\n');
  }
}
