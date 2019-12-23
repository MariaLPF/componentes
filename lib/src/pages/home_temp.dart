import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = ['uno', 'dos', 'tres','cuatro','cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
        children: _createItems(),
      ),
    );
  }

  List<Widget> _createItems(){
    List<Widget> result = new List<Widget>();
    for (var item in options) {
      result..add(ListTile(
                   title: Text(item),
                  ))
            ..add(Divider(
                    height: 15,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ));
    }
    return result;
  }
}