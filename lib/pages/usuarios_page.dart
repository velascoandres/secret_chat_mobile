import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:secret_chat_mobile/models/usuario.dart';
import 'package:secret_chat_mobile/services/auth_service.dart';
import 'package:secret_chat_mobile/services/socket_service.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  Usuario usuario;

  RefreshController _refreshController = new RefreshController();

  final usuarios = [
    Usuario(id: '1', username: 'Maria', email: 'marial@test.com', online: true),
    Usuario(id: '2', username: 'Marcia', email: 'marial@test.com', online: true),
    Usuario(id: '3', username: 'Andres', email: 'marial@test.com', online: false),
    Usuario(id: '4', username: 'Pepe', email: 'marial@test.com', online: true),
  ];
  @override
  Widget build(BuildContext context) {
    final AuthService authService = Provider.of<AuthService>(context);
    final SocketService socketService = Provider.of<SocketService>(context);
    this.usuario = authService.usuario;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '${usuario.username}',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.redAccent,
          ),
          onPressed: () {
            socketService.disconnect();
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.check_circle,
              color: socketService.serverStatus == ServerStatus.Online
                  ? Colors.blue[400]
                  : Colors.redAccent,
            ),
            // child: Icon(
            //   Icons.offline_bolt,
            //   color: Colors.red,
            // ),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: this._refreshController,
        child: _buildUsersListView(),
        enablePullDown: true,
        onRefresh: this._cargarUsuarios,
      ),
    );
  }

  ListView _buildUsersListView() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _buildUserListTile(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: this.usuarios.length,
    );
  }

  ListTile _buildUserListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.username),
      subtitle: Text(usuario.username),
      leading: CircleAvatar(
        child: Text(
          usuario.username.substring(0, 2),
        ),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green[300] : Colors.red,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(
      Duration(milliseconds: 1000),
    );
    this.usuarios.add(
          Usuario(
              id: '4', username: 'Pepe', email: 'marial@test.com', online: true),
        );
    setState(() {});
    _refreshController.refreshCompleted();
  }
}
