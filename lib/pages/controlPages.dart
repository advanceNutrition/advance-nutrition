import "package:flutter/material.dart";
import '../pages/new_food.dart';
import '../backend/model/Food.dart';
import '../pages/food_list.dart';
import '../pages/diario.dart';
import 'food_list.dart';
import 'perfil.dart';
import 'inicio.dart';

class ControlPages extends StatefulWidget {
  @override
  _ControlPagesState createState() => _ControlPagesState();
}

class _ControlPagesState extends State<ControlPages> {
  List<Food> recentFoods = [];
  void _addFood(name, grams, calories, date) {
    setState(() {
      recentFoods
          .add(Food(calories: calories, date: date, grams: grams, name: name));
    });
  }

  void _startAddFood() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewFood(_addFood);
        });
  }

  void _deleteFood(name) {
    setState(() {
      recentFoods.removeWhere((food) => food.name == name);
    });
  }


  int _indiceAtual = 0;


  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _telas = [
      Inicio(),
      Diario(title: "Diario"),
      Perfil()
    ];

    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _indiceAtual,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Início",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined ),
              label: "Diário",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil",
              backgroundColor: Colors.blue),
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