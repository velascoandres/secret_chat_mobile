import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final bool autocorrect;
  final TextEditingController textEditingController;

  CustomInputField({
    Key key,
    @required this.hint,
    @required this.prefixIcon,
    @required this.textEditingController,
    this.textInputType = TextInputType.text,
    this.obscure = false,
    this.autocorrect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: this.textEditingController,
        obscureText: this.obscure,
        autocorrect: false,
        keyboardType: this.textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(this.prefixIcon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: this.hint,
        ),
      ),
    );
  }
}
