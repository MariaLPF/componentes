import 'package:flutter/material.dart';


class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _name ='';
  String _email = '';
  String _date = '';
  List<String> _powers = ['Volar', 'Rayos X', 'Super aliento', 'Super fuerza'];
  String _optionSelect = 'Volar';

  TextEditingController _inputController = new TextEditingController();

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
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropDown(),
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

  Widget  _createEmail() {
      return TextField(
        keyboardType:TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          hintText:'Escribe un email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)
        ),
        onChanged: (valor) => setState(() {
            _email = valor;
        })
          
        
      );
  }

  Widget  _createPassword() {
      return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          
          hintText:'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock),
          icon: Icon(Icons.lock)
        ),
        onChanged: (valor) => setState(() {
            _email = valor;
        })
      );
  }

  Widget _createDate(BuildContext context) {
      return TextField(
        enableInteractiveSelection: false,
        controller: _inputController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          
          hintText:'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)
        ),
        onTap: (){
          //Quita el foco del widget
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      );
  }

  void _selectDate(BuildContext contex) async {
    DateTime picked = await showDatePicker(
      context: contex,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES')
    );

    if(picked !=null){
      setState(() {
        _date = picked.toString();
        _inputController.text = _date;
      });
    }
  }
  
  List<DropdownMenuItem<String>> _getOptionsDropDown(){
    List<DropdownMenuItem<String>> result = new List();
    _powers.forEach((poder){
      result.add(DropdownMenuItem(
        value: poder,
        child: Text(poder),
       )
      );
    });
    return result;
  }

  Widget _createDropDown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          
          child: DropdownButton(
                isExpanded: true,
                value: _optionSelect,
                items: _getOptionsDropDown(),
                onChanged: (itemSelect){
                  setState(() {
                    _optionSelect = itemSelect;
                  });
                },
              ),
        ),
      ],
    );
    
    
    
    
  }

  Widget _createPerson(){
    return ListTile(
      title: Text('Nombre es $_name'),
      subtitle: Text('Email $_email'),
      trailing: Text(_optionSelect),
    );
  }
  
  
  



}