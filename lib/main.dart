import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
     initialRoute: '/',
     routes: getAppRoutes(),
     onGenerateRoute: (settings){
       print('Ruta llamada: ${settings.name}');
       return MaterialPageRoute(
         builder: (BuildContext context) => AlertPage()
       );
     },
    );
  }
}