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
                onChanged: (String texto) {},
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
          child: Text('Enviar'), onPressed: this._enviarMensaje);
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: IconButton(
          onPressed: this._enviarMensaje,
          icon: Icon(
            Icons.send,
            color: Colors.blue[400],
          ),
        ),
      );
    }
  }

  void _enviarMensaje() {}
  void _manejarEnvioMensaje(String mensaje) {
    this._textController.clear();
    this._focusNode.requestFocus();
  }
}
