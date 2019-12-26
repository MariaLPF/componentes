import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list(){

     print( menuProvider.opciones);

      return ListView(
        children: _listItems(),
      );
      
  }

  List<Widget> _listItems() {
    return [
      ListTile( title: Text('Hola Mundo')),
      Divider(),
      ListTile( title: Text('Hola Mundo')),
      Divider(),
      ListTile( title: Text('Hola Mundo')),
      Divider(),
      ListTile( title: Text('Hola Mundo')),
    ];
  }
}