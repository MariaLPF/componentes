import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _items = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addItems(10);

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        setState(() {
          //_addItems(10);
          if(!_isLoading){
            _fetchData();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children:[
          _createList(),
          _createLoading()
        ],
      )
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

  Future<Null> _fetchData() async{

    _isLoading = true;
    setState(() { });

    final duration = new Duration(seconds: 2);
    //Simulamos el tiempo de respuesta de una peticion http, 
    // por ello solo pasamos el nombre del metodo sin los parentesis.
    return new Timer(duration, _responseHttp);

  }

  void _responseHttp(){
    _isLoading = false;
    
    _addItems(10);

    _scrollController.animateTo(
      _scrollController.position.pixels+50.0,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250));
  }

  Widget _createLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          Padding(padding:EdgeInsets.only(bottom: 20.0)),
        ],
      );
    }else{
      return Container();
    }
  }

}