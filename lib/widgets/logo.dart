import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/logos/dart-logo.png'),
            ),
            Text(
              'Secret Chat',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
