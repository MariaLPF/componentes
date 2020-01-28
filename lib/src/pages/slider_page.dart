import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _sliderDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            Expanded(
              child: _createImage()
            )
          ],
        ),
      ),
    );
  }

  Widget _createSlider(){

    return Slider(
      activeColor:Colors.indigoAccent,
      label:'Tamaño de la imagen',
   // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: _sliderDisabled ?null:(double value) {
        setState(() {
          _valorSlider = value;
        });
               
      },

    );

  }

  Widget _createImage(){
    return Image(
        image: NetworkImage('https://qph.fs.quoracdn.net/main-qimg-19d63539771b0676c514755586b5719e'),
        width: _valorSlider,
        fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    return Checkbox(
      value: _sliderDisabled,
      onChanged: (bool select){
        setState(() {
          _sliderDisabled = select;
        });
      },
    );
  }
}