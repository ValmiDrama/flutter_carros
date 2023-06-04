// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, unnecessary_null_comparison
// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_carros/pages/carros/carro_details_page.dart';
import 'package:flutter_carros/pages/carros/carros_api.dart';
import 'package:flutter_carros/pages/carros/carros_model.dart';
import 'package:flutter_carros/utils/push.dart';

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

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    List<Carro> carros = await CarrosApi.getCarros(widget.tipo);
    setState(() {
      this.carros = carros;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future<List<Carro>> future = CarrosApi.getCarros();
    // Future<List<Carro>> future = CarrosApi.getCarros(widget.tipo);
    super.build(context);

    if (carros == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return _listView(carros);
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: c.urlFoto ??
                          "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png",
                      width: 250,
                    ),
                  ),
                  Text(
                    c.nome ?? '',
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
                          onPressed: () => _onClickCarro(context, c),
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

  _onClickCarro(context, Carro c) {
    push(context, CarroDetailhesPage(c));
  }
}
