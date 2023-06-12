// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, unnecessary_null_comparison, unused_field
// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_carros/pages/carros/carro_details_page.dart';
import 'package:flutter_carros/pages/carros/carros_api.dart';
import 'package:flutter_carros/pages/carros/carros_model.dart';
import 'package:flutter_carros/utils/push.dart';
import 'package:flutter_carros/widgets/text.error.dart';

class CarrosListView extends StatefulWidget {
  String tipo;

  CarrosListView({
    Key? key,
    required this.tipo,
  }) : super(key: key);

  @override
  State<CarrosListView> createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  late List<Carro> carros;

  final _streamController = StreamController<List<Carro>>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    List<Carro> carros = await CarrosApi.getCarros(widget.tipo);

    _streamController.add(carros);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const TextError("Não foi possível encontrar os carros");
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Carro>? carros = snapshot.data;

          return _listView(carros!);
        });
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro carrosLista = carros[index];

          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: carrosLista.urlFoto ??
                          "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png",
                      width: 250,
                    ),
                  ),
                  Text(
                    carrosLista.nome ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 25),
                  ),
                  const Text(
                    "descrição...",
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBarTheme(
                    data: const ButtonBarThemeData(),
                    child: ButtonBar(
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text('DETALHES'),
                          onPressed: () => _onClickCarro(context, carrosLista),
                        ),
                        ElevatedButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCarro(context, Carro carro) {
    push(context, CarroDetailhesPage(carro));
  }
}
