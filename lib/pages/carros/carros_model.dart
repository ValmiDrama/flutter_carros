import 'dart:convert' as convert;

import 'package:flutter_carros/utils/event_bus.dart';
import 'package:flutter_carros/utils/sql/entity/entity.dart';

class CarroEvent extends Event {
  // salvar, deletar
  String acao;

  // classicos, esportivos, luxo
  String tipo;

  CarroEvent(this.acao, this.tipo);

  @override
  String toString() {
    return 'CarroEvent{acao: $acao, tipo: $tipo}';
  }
}

class Carro extends Entity {
  int? id;
  late String? nome;
  late String? tipo;
  late String? descricao;
  late String? urlFoto;
  late String? urlVideo;
  late String? latitude;
  late String? longitude;

  // get latlng => LatLng(latitude.isEmpty ? 0.0 : double.parse(latitude),
  //     longitude.isEmpty ? 0.0 : double.parse(longitude));

  Carro(
      {this.id,
      this.nome,
      this.tipo,
      this.descricao,
      this.urlFoto,
      this.urlVideo,
      this.latitude,
      this.longitude});

  Carro.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    tipo = map['tipo'];
    descricao = map['descricao'];
    urlFoto = map['urlFoto'];
    urlVideo = map['urlVideo'];
    latitude = map['latitude'];
    longitude = map['longitude'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['tipo'] = tipo;
    data['descricao'] = descricao;
    data['urlFoto'] = urlFoto;
    data['urlVideo'] = urlVideo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }

  @override
  String toString() {
    return 'Carro{id: $id, nome: $nome, tipo: $tipo, descricao: $descricao, urlFoto: $urlFoto, urlVideo: $urlVideo, latitude: $latitude, longitude: $longitude}';
  }
}