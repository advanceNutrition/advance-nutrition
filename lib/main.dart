import 'package:flutter/material.dart';
import 'package:advance_nutrition/pages/controlPages.dart';
import 'package:advance_nutrition/pages/inicio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'pages/login.dart';
import 'package:advance_nutrition/backend/service/DAO.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
   runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }

}
