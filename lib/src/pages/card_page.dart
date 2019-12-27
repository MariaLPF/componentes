import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[_cardType1(), SizedBox(height: 30), _cardType2()],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blueGrey,
            ),
            title: Text('Soy el titulo de esta targeta'),
            subtitle: Text(
                'Esto es una descripción de una targeta para ver una descripcion de lo que queremos ver'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    return Card(
      child: Column(
        children: <Widget>[
          Image(
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/7/78/Frosty_Raftsundet_landscape_with_Trolltindan_in_morning%2C_2012_October.JPG'),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Paisaje')
          )
        ],
      ),
    );
  }
}
