import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<int> _items = [1,2,3,4,5];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _createList(),
    );
  }

  Widget _createList(){
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index){
        int _image = _items[index];

        return FadeInImage(
          image: NetworkImage('https://i.picsum.photos/id/$_image/500/300.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }
}