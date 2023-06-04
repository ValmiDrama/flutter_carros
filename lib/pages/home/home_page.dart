import 'package:flutter/material.dart';
import 'package:flutter_carros/pages/carros/carros_api.dart';
import 'package:flutter_carros/pages/carros/carros_listview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: CarrosListView(
        tipo: TipoCarro.classicos,
      ),
    );
  }
}
