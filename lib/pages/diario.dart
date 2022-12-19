import 'package:flutter/material.dart';

import '../backend/model/Food.dart';
import "../pages/food_list.dart";
import "../pages/new_food.dart";


class Diario extends StatefulWidget {
  Diario({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DiarioState createState() => _DiarioState();
}

class _DiarioState extends State<Diario> {
  List<Food> _recentFoods = [
    Food(
        name: "Chicken Breast", calories: 567, grams: 40, date: DateTime.now()),
    Food(name: "Protein Shake", calories: 400, grams: 50, date: DateTime.now())
  ];

  void _addFood(name, grams, calories, date) {
    setState(() {
      _recentFoods
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
      _recentFoods.removeWhere((food) => food.name == name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diario Alimentar", textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _startAddFood,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[FoodList(_recentFoods, _deleteFood)],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAddFood,
        child: Icon(Icons.add),
      ),
    );
  }
}