import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret_chat_mobile/routes/routes.dart';
import 'package:secret_chat_mobile/services/auth_service.dart';
import 'package:secret_chat_mobile/services/chat_service.dart';
import 'package:secret_chat_mobile/services/socket_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => SocketService()),
        ChangeNotifierProvider(create: (_) => ChatService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Caht App',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}
