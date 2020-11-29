import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = new TextEditingController();
  final FocusNode _focusNode = new FocusNode();
  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Text(
                'Te',
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Melissa Flores',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
        elevation: 3,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, i) => Text(i.toString()),
                reverse: true,
              ),
            ),
            Divider(height: 1),
            Container(
              color: Colors.white,
              height: 100,
              child: this._inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: this._textController,
                onSubmitted: this._manejarEnvioMensaje,
                onChanged: (String texto) =>
                    setState(() => this._estaEscribiendo = texto != ''),
                decoration: InputDecoration.collapsed(
                  hintText: 'Escribe tu mensaje',
                ),
                focusNode: this._focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: this._botonEnviar(),
            )
          ],
        ),
      ),
    );
  }

  Widget _botonEnviar() {
    if (Platform.isIOS) {
      return CupertinoButton(
          child: Text('Enviar'),
          onPressed: this._estaEscribiendo ? this._enviarMensaje : null);
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: IconTheme(
          data: IconThemeData(color: Colors.blue[400]),
          child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: this._estaEscribiendo ? this._enviarMensaje : null,
            icon: Icon(
              Icons.send,
            ),
          ),
        ),
      );
    }
  }

  void _enviarMensaje() {
    this._manejarEnvioMensaje(this._textController.text.trim());
  }

  void _manejarEnvioMensaje(String mensaje) {
    this._textController.clear();
    this._focusNode.requestFocus();
  }
}
