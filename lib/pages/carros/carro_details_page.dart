// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carros/pages/carros/carros_model.dart';
import 'package:flutter_carros/widgets/text.dart';

class CarroDetailhesPage extends StatefulWidget {
  final Carro carro;

  const CarroDetailhesPage(this.carro, {super.key});

  @override
  _CarroDetailhesPageState createState() => _CarroDetailhesPageState();
}

class _CarroDetailhesPageState extends State<CarroDetailhesPage> {
  // final _loripsumApiBloc = LoripsumBloc();

  Color color = Colors.grey;

  Carro get carro => widget.carro;

  @override
  void initState() {
    super.initState();

    // _loripsumApiBloc.fetch();

    // FavoritoService().isFavorito(carro).then((bool favorito) {
    //   setState(() {
    //     color = favorito ? Colors.red : Colors.grey;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.carro.nome ?? ''),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: _onClickPopupMenu,
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),
                ),
                const PopupMenuItem(
                  value: "Deletar",
                  child: Text("Deletar"),
                ),
                const PopupMenuItem(
                  value: "Share",
                  child: Text("Share"),
                )
              ];
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          CachedNetworkImage(
              imageUrl: widget.carro.urlFoto ??
                  "https://telhafer.com.br/image/no_image.jpg"),
          _bloco1(),
          const Divider(),
          _bloco2(),
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              text('widget.carro.nome', fontSize: 20, bold: true),
              text('widget.carro.tipo', fontSize: 16)
            ],
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: color,
                size: 40,
              ),
              onPressed: _onClickFavorito,
            ),
            IconButton(
              icon: const Icon(
                Icons.share,
                size: 40,
              ),
              onPressed: _onClickShare,
            )
          ],
        )
      ],
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        text('widget.carro.descricao', fontSize: 16, bold: true),
        const SizedBox(
          height: 20,
        ),
        // StreamBuilder<String>(
        //   stream: _loripsumApiBloc.stream,
        //   builder: (_, snapshot) {
        //     if (!snapshot.hasData) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }

        //     return text(snapshot.data, fontSize: 16);
        //   },
        // ),
      ],
    );
  }

  void _onClickMapa() {
    // if (carro.latitude != null && carro.longitude != null) {
    //   push(context, MapPage(carro));
    // } else {
    //   alert(context, "Este carro não possui Lat/Lng da fábrica.");
    // }
  }

  void _onClickVideo() {
    // if (carro.urlVideo != null && carro.urlVideo.isNotEmpty) {
    //   launch(carro.urlVideo);

//      push(context, VideoPage(carro));
    // } else {
    //   alert(context, "Este carro não possui nenhum vídeo");
    // }
  }

  _onClickPopupMenu(String value) {
    // switch (value) {
    //   case "Editar":
    //     push(context, CarroFormPage(carro: carro));
    //     break;
    //   case "Deletar":
    //     deletar();
    //     break;
    //   case "Share":
    //     print("Share !!!");
    //     break;
    // }
  }

  void _onClickFavorito() async {
    // bool favorito = await FavoritoService().favoritar(carro);

    // setState(() {
    //   color = favorito ? Colors.red : Colors.grey;
    // });
  }

  void _onClickShare() {}

  void deletar() async {
    // ApiResponse<bool> response = await CarrosApi.delete(carro);

    // if (response.ok) {
    //   alert(context, "Carro deletado com sucesso", callback: () {
    //     EventBus.get(context)
    //         .sendEvent(CarroEvent("carro_deletado", carro.tipo));

    //     pop(context);
    //   });
    // } else {
    //   alert(context, response.msg);
    // }
  }

  @override
  void dispose() {
    super.dispose();

    // _loripsumApiBloc.dispose();
  }
}
