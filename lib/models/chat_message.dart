import 'dart:convert';

import 'package:flutter/material.dart';

class ChatMessage {
  String emisor;
  String destinatario;
  String contenido;
  String fechaEnvio;

  ChatMessage({
    @required this.emisor,
    @required this.contenido,
    @required this.destinatario,
    @required this.fechaEnvio,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      contenido: json['contenido'],
      emisor: json['emisor'],
      destinatario: json['destinatario'],
      fechaEnvio: json['fechaEnvio'],
    );
  }
}
