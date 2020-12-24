import 'package:secret_chat_mobile/global/environment.dart';
import 'package:secret_chat_mobile/library/principal_provider.dart';
import 'package:secret_chat_mobile/models/usuario.dart';

class UsuarioRestService extends PrincipalProvider<Usuario>{
  final String url = '${Environment.domain}';
  final String segmento = 'usuario';
  final FromJsonCallBack<Usuario> fromJsonCallBack = Usuario.fromJson;
}