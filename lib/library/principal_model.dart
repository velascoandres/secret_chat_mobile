import 'package:secret_chat_mobile/library/serializable_model.dart';

abstract class PrincipalModel extends DeserializableModel {
  PrincipalModel({
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
}
