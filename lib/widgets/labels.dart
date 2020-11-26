import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final GestureDoubleTapCallback onTap;
  final String tapTitle;
  final String title;

  Labels(
      {Key key, @required this.onTap, @required this.tapTitle, this.title = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.title,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: this.onTap,
          child: Text(
            this.tapTitle,
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
