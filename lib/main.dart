import 'package:advance_nutrition/backend/Service/usuarioService.dart';
import 'package:flutter/material.dart';
import 'package:advance_nutrition/pages/controlPages.dart';
import 'package:advance_nutrition/pages/inicio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'pages/loginPage.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => UsuarioService().init());
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
