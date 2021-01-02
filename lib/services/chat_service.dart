import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:secret_chat_mobile/global/environment.dart';
import 'package:secret_chat_mobile/models/chat_message.dart';

import 'package:secret_chat_mobile/models/usuario.dart';
import 'package:secret_chat_mobile/services/auth_service.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  final String url = '${Environment.domain}';
  final String segmento = 'message';

  Future<List<ChatMessage>> getBandeja(String usuarioId) async {
    final token = await AuthService.token;

    final respuesta = await http.get(
        '${Environment.domain}/$segmento/bandeja-mensajes/$usuarioId',
        headers: {
          'Content-Type': 'application/json',
          'authorization': 'Bearer $token',
        });

    if (respuesta.statusCode != 200) return [];

    final messagesRes = messagesResponseFromJson(respuesta.body);
    return messagesRes.messages;
  }
}
