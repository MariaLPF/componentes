import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _items = new List();
  int _lastItem = 0;

  @override
  void initState() {
    super.initState();
    _addItems(10);

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        setState(() {
          _addItems(10);
        });
      }
    });
  }
  
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
      controller: _scrollController,
    );
  }

  void _addItems( int amount){
    int maxItems = _lastItem + amount;
    for (var i = _lastItem; i < maxItems; i++) {
      _items.add(i+1);
    }
    
    setState(() {
      _lastItem = maxItems;
    });
  }

}