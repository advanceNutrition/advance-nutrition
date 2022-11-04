
import 'package:flutter/material.dart';
import 'perfil.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Geometria'),
      home: Scaffold(
        body: PaginaPerfil(),
      ),
    );
  }
}



