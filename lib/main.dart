import 'package:flutter/material.dart';
import 'package:secret_chat_mobile/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caht App',
      initialRoute: 'login',
      routes: appRoutes,
    );
  }
}