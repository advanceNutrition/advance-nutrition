import 'package:advance_nutrition/pages/inicio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:advance_nutrition/pages/controlPages.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cadastro.dart';
import '../backend/service/DAO.dart';
import '../backend/model/Usuario.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:navigation_drawer_menu/navigation_drawer_state.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DAO dao = new DAO();
  Usuario userFromBD = new Usuario(-1, "", "", "");
  String _errorMessage = "";
  final NavigationDrawerState state = NavigationDrawerState();
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerSenha = TextEditingController();
  var bytesToHash;
  var converted;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 200,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/logo.png',
                    )
                ),
              ),
            ),
            SizedBox(height: 100),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _textEditingControllerEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'example@gmail.com'),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _textEditingControllerSenha,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'password'),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Esqueci a senha',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async => {
                  if(_textEditingControllerEmail.text != "" &&
                     _textEditingControllerSenha.text != "" &&
                     EmailValidator.validate(
                       _textEditingControllerEmail.text, true)){
                    userFromBD = await dao.listarUnicoUsuario(
                      _textEditingControllerEmail.text),

                    if(userFromBD.getID() != -1){
                      bytesToHash = utf8.encode(
                        _textEditingControllerSenha.text),
                      converted = md5.convert(bytesToHash),

                      if(userFromBD.getSenha() == converted.toString()){
                        await _salvarDados(userFromBD.getID()),

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ControlPages()),
                        ),

                      }else{
                        setState((){
                          _errorMessage = "Invalid email or password.";
                        })
                      }
                    }else{
                      setState((){
                        _errorMessage = "Invalid email or password";
                      }),
                    }
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: InkWell(
                child: Text('Não possui conta? Cadastre-se', style: TextStyle(color: Colors.blue, fontSize: 15)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _salvarDados(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
        "isLogged", id); // a chave será usada para recuperar dados
    print("Operação salvar: ${id}");
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty.";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address.";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}