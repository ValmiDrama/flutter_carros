// ignore_for_file: avoid_print

import 'carros_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TipoCarro {
  static const String classicos = "classicos";
  static const String esportivos = "esportivos";
  static const String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String? tipo) async {
    // static Future<List<Carro>> getCarros() async {
    var url =
        'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';
    // 'https://carros-springboot.herokuapp.com/api/v1/carros';

    print("GET > $url");

    var response = await http.get(Uri.parse(url));

    String json = response.body;

    List list = convert.json.decode(json);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }

  // static Future<ApiResponse> save(Carro c, File file) async {
  //   try {
  //     ApiResponse<String> response = await UploadApi.upload(file);
  //     if (response.ok) {
  //       String? urlFoto = response.result;
  //       c.urlFoto = urlFoto ?? '';
  //     }

  //     var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';
  //     url += "/${c.id}";

  //     print("POST > $url");

  //     String json = c.toJson();

  //     print("   JSON > $json");

  //     var response = await (c.id == null
  //         ? http.post(Uri.parse(url), body: json)
  //         : http.put(Uri.parse(url), body: json));

  //     // print('Response status: ${response.statusCode}');
  //     // print('Response body: ${response.body}');

  //     if (response.ok == 200 || response.ok == 201) {
  //       Map mapResponse = convert.json.decode(response.body);

  //       Carro carro = Carro.fromMap(mapResponse);

  //       print("Novo carro: ${carro.id}");

  //       return ApiResponse.ok();
  //     }

  //     if (response.body.isEmpty) {
  //       return ApiResponse.error(msg: "Não foi possível salvar o carro");
  //     }

  //     Map mapResponse = convert.json.decode(response.body);
  //     return ApiResponse.error(msg: mapResponse["error"]);
  //   } catch (e) {
  //     print(e);

  //     return ApiResponse.error(msg: "Não foi possível salvar o carro");
  //   }
  // }

  // static Future<ApiResponse> delete(Carro c) async {
  //   try {
  //     var url = 'https://carros-springboot.herokuapp.com/api/v1/carros/${c.id}';

  //     print("DELETE > $url");

  //     var response = await http.delete(url);

  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       return ApiResponse.ok();
  //     }

  //     return ApiResponse.error(msg: "Não foi possível deletar o carro");
  //   } catch (e) {
  //     print(e);

  //     return ApiResponse.error(msg: "Não foi possível deletar o carro");
  //   }
  // }
}
