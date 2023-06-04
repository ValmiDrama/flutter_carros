// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_carros/pages/carros/carros_api.dart';
import 'package:flutter_carros/pages/carros/carros_model.dart';

class CarrosListView extends StatelessWidget {
  String tipo;
  CarrosListView({
    Key? key,
    this.tipo = TipoCarro.classicos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    // Future<List<Carro>> future = CarrosApi.getCarros();
    Future<List<Carro>> future = CarrosApi.getCarros(TipoCarro.classicos);

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Erro');
          const Center(
            child: Text("Error Data"),
          );
        }
        // if (snapshot.hasData) {
        //   print('Data');
        //   return const Center(child: CircularProgressIndicator());
        // }

        List<Carro> carros = snapshot.data ?? [];
        return _listView(carros);
      },
    );
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
    // push(context, CarroPage(c));
  }
}
