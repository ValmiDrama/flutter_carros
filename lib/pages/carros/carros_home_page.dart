import 'package:flutter/material.dart';
import 'package:flutter_carros/pages/carros/carros_listview_widget.dart';

class CarrosHomePage extends StatefulWidget {
  const CarrosHomePage({super.key});

  @override
  _CarrosHomePageState createState() => _CarrosHomePageState();
}

class _CarrosHomePageState extends State<CarrosHomePage>
    with SingleTickerProviderStateMixin<CarrosHomePage> {
  // TabController _tabController;

  @override
  void initState() {
    super.initState();

    // _initTabs();
  }

  /*_initTabs() async {
    _tabController = TabController(length: 4, vsync: this);

    _tabController.index = await Prefs.getInt("tabIdx");

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }*/

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
      // appBar: AppBar(
      //   title: const Text("Carros"),
      //   bottom: _tabController == null
      //       ? null
      //       : TabBar(
      //           controller: _tabController,
      //           tabs: const [
      //             Tab(
      //               text: "Clássicos",
      //               icon: Icon(Icons.directions_car),
      //             ),
      //             Tab(
      //               text: "Esportivos",
      //               icon: Icon(Icons.directions_car),
      //             ),
      //             Tab(
      //               text: "Luxo",
      //               icon: Icon(Icons.directions_car),
      //             ),
      //             Tab(
      //               text: "Favoritos",
      //               icon: Icon(Icons.favorite),
      //             )
      //           ],
      //         ),
      // ),
      body: CarrosListView(),
      // body: _tabController == null
      //     ? null
      //     : TabBarView(
      //         controller: _tabController,
      //         children: [
      //           CarrosListView(TipoCarro.classicos),
      //           CarrosListView(TipoCarro.esportivos),
      //           CarrosListView(TipoCarro.luxo),
      //           // FavoritosPage(),
      //         ],
      //       ),
      // drawer: DrawerList(),
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
