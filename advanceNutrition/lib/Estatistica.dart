import 'package:flutter/material.dart';

class Estatistica extends StatelessWidget {
  final String texto;

  Estatistica(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(texto),
      ),
    );
  }
}
