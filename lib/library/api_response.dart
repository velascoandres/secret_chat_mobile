import 'package:secret_chat_mobile/library/principal_model.dart';

class ApiResponse<T extends PrincipalModel> {
  ApiResponse({
    this.data,
    this.total,
  });

  List<T> data;
  int total;

  factory ApiResponse.fromJson(Map<String, dynamic> json,
          Function(Map<String, dynamic> json) fromJson) =>
      ApiResponse(
        data: List.from(
            json["data"].map((x) => fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}
