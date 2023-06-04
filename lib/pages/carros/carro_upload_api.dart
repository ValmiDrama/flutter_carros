// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:async';
import 'dart:io';
import 'dart:convert' as convert;

import 'package:flutter_carros/api_response.dart';

import 'package:flutter_carros/utils/http_helper.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

class UploadApi {
  static Future<ApiResponse<String>> upload(File file) async {
    try {
      String url = "https://carros-springboot.herokuapp.com/api/v1/upload";

      List<int> imageBytes = file.readAsBytesSync();
      String base64Image = convert.base64Encode(imageBytes);

      String fileName = path.basename(file.path);

      var params = {
        "fileName": fileName,
        "mimeType": "image/jpeg",
        "base64": base64Image
      };

      String json = convert.jsonEncode(params);

      print("http.upload: $url");
      print("params: $json");

      final response = await http.post(url, body: json).timeout(
            const Duration(seconds: 120),
            onTimeout: _onTimeOut,
          );

      print("http.upload << ${response.body}");

      Map<String, dynamic> map = convert.json.decode(response.body);

      String urlFoto = map["url"];

      return ApiResponse.ok(result: urlFoto);
    } catch (error, exception) {
      print("Erro ao fazer upload $error - $exception");
      return ApiResponse.error(msg: "Não foi possível fazer o upload");
    }
  }

  static FutureOr<Response> _onTimeOut() {
    print("timeout!");
    throw const SocketException(
        "Não foi possível se comunicar com o servidor.");
  }
}
