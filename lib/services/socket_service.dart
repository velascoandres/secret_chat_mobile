import 'package:flutter/material.dart';
import 'package:secret_chat_mobile/global/environment.dart';
import 'package:secret_chat_mobile/services/auth_service.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;

  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;

  void connect() async {
    final token = await AuthService.token;
    // Dart client
    print('conectando...');
    this._socket = IO.io('${Environment.domainWS}/chat', {
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
      'extraHeaders': {
        'authorization': 'Bearer $token'
      },
    });

    this._socket.on('connect', (_) {
      print('conectado a chat');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
  }

  void disconnect() {
    this._socket.disconnect();
  }
}
