// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_carros/drawer.dart';
import 'package:flutter_carros/pages/carros/carros_api.dart';
import 'package:flutter_carros/pages/carros/carros_listview_widget.dart';
import 'package:flutter_carros/utils/prefs.dart';

class CarrosHomePage extends StatefulWidget {
  const CarrosHomePage({super.key});

  @override
  _CarrosHomePageState createState() => _CarrosHomePageState();
}

class _CarrosHomePageState extends State<CarrosHomePage>
    with SingleTickerProviderStateMixin<CarrosHomePage> {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _initTabs();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _initTabs() async {
    int tabIdx = await Prefs.getInt("tabIdx");

    _tabController = TabController(length: 3, vsync: this);

    Future<int> futureind = Prefs.getInt('tabIdx');

    futureind.then((int tabIdx) => _tabController.index = tabIdx);
    // _tabController.index = await Prefs.getInt("tabIdx");

    setState(() {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  // _initTabs() async {
  //   int index = await Prefs.getInt("tabIdx");

  //   _tabController = TabController(length: 4, vsync: this);
  //   setState(() {
  //     _tabController.index = index;
  //   });

  //   _tabController.addListener(() {
  //     Prefs.setInt("tabIdx", _tabController.index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carros"),
        bottom:
            //  _tabController == null
            //     ? null
            //     :
            TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Clássicos",
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              text: "Esportivos",
              icon: Icon(Icons.directions_car),
            ),
            Tab(
              text: "Luxo",
              icon: Icon(Icons.directions_car),
            ),
            // Tab(
            //   text: "Favoritos",
            //   icon: Icon(Icons.favorite),
            // )
          ],
        ),
      ),
      body:
          // _tabController == null
          //     ? null
          //     :
          TabBarView(
        controller: _tabController,
        children: [
          CarrosListView(tipo: TipoCarro.classicos),
          CarrosListView(tipo: TipoCarro.esportivos),
          CarrosListView(tipo: TipoCarro.luxo),
          // FavoritosPage(),
        ],
      ),
      drawer: const DrawerList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickAdicionarCarro,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onClickAdicionarCarro() {
    // push(context, CarroFormPage());
  }
}
