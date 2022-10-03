import "package:flutter/material.dart";

import 'Diario.dart';
import 'Perfil.dart';
import 'Estatistica.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Inicio(),
  ));
}

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    Home("Início"),
    Diario("Meu Diario"),
    Estatistica("Minha Estatistica"),
    Perfil("Meu Perfil")
  ];

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADVANCE NUTRITION",
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Início",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              label: "Diário",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph),
              label: "Estatística",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil",
              backgroundColor: Colors.black),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  final String texto;

  Home(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(texto),
      ),
    );
  }
}
