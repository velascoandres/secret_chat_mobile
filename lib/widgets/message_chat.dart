import 'package:flutter/material.dart';

import 'package:secret_chat_mobile/colors/colors.dart';

class MessageChat extends StatelessWidget {
  final String texto;
  final String uuid;

  const MessageChat({Key key, @required this.texto, @required this.uuid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _myMessage(context: context, myMessage: this.uuid == '123'),
    );
  }

  Widget _myMessage({
    BuildContext context,
    bool myMessage = true,
  }) {
    final maxWidth = MediaQuery.of(context).size.width * 0.5;
    return Align(
      alignment: myMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(minWidth: 10, maxWidth: maxWidth),
        margin: EdgeInsets.only(
          bottom: 5,
          left: myMessage ? 0 : 10,
          right: myMessage ? 10 : 0,
        ),
        child: Text(
          this.texto,
          style: TextStyle(color: Colors.white),
        ),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Color(myMessage ? BLUE : GREEN),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _otherMessage() {
    return Container();
  }
}
