import 'package:flutter/material.dart';


class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _name ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget  _createInput() {
    return TextField(
      //autofocus : true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_name.length}'),
        hintText:'Escribe un nombre',
        labelText: 'Nombre',
        helperText: 'Sólo es un nombre',
        suffixIcon: Icon(Icons.accessibility_new),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
          _name = valor;
        });
        
      },
    );
  }
  Widget _createPerson(){
    return ListTile(
      title: Text('Nombre es $_name'),
    );
  }
}