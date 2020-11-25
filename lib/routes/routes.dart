import 'package:flutter/widgets.dart';
import 'package:secret_chat_mobile/pages/pages_index.dart';

typedef contextFunction = Widget Function(BuildContext context);

final Map<String, contextFunction> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};
