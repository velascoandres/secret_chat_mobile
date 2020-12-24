import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:secret_chat_mobile/library/api_response.dart';
import 'package:secret_chat_mobile/library/principal_model.dart';

typedef FromJsonCallBack<T> = T Function(Map<String, dynamic> json);

abstract class PrincipalProvider<T extends PrincipalModel> {
  @protected
  final String url = '';

  @protected
  final String segmento = '';

  @protected
  FromJsonCallBack<T> fromJsonCallBack;

  Future<bool> create(T model, {Map<String, dynamic> headers}) async {
    final uri = '$url/$segmento';
    final modelParsed = json.encode(model.toJson());
    // Handling response
    try {
      final response = await http.post(uri, body: modelParsed);
      if (response.statusCode == 200) return true;
      return false;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> update(String id, T model,
      {Map<String, dynamic> headers}) async {
    final uri = '$url/$segmento/$id';
    final modelParsed = json.encode(model.toJson());

    // Handling response
    try {
      final response = await http.put(uri, body: modelParsed);
      if (response.statusCode == 200) return true;
      return false;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<ApiResponse<T>> findAll(
      {Map<String, dynamic> query, Map<String, dynamic> headers}) async {
    final queryParams = json.encode(query);
    final uri = '$url/$segmento?query=$queryParams';
    final response = await http.get(uri, headers: headers);

    // Handling response
    try {
      final Map<String, dynamic> decodedData = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (decodedData == null) return null;
        return ApiResponse.fromJson(decodedData, this.fromJsonCallBack);
      }
      return null;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> delete(String id, {Map<String, dynamic> headers}) async {
    final uri = '$url/$segmento/$id';
    try {
      final response = await http.delete(uri);
      if (response.statusCode == 200) return true;
      return false;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
