import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret_chat_mobile/pages/pages_index.dart';
import 'package:secret_chat_mobile/services/auth_service.dart';
import 'package:secret_chat_mobile/services/socket_service.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SocketService socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: FutureBuilder(
        future: this._checkLoginState(context, socketService),
        builder: (context, snapshot) => Center(
          child: Container(
            child: Text('Espere....'),
          ),
        ),
      ),
    );
  }

  Future _checkLoginState(
      BuildContext context, SocketService socketService) async {
    final AuthService authService =
        Provider.of<AuthService>(context, listen: false);
    final autenticado = await authService.isLoggedIn();
    if (autenticado) {
      // TODO: conectar los sockets
      socketService.connect();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => UsuariosPage(),
          transitionDuration: Duration(milliseconds: 0),
        ),
      );
    } else {
      if (socketService.socket != null) socketService.disconnect();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => LoginPage(),
          transitionDuration: Duration(milliseconds: 0),
        ),
      );
    }
  }
}
