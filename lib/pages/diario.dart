import 'package:flutter/material.dart';

class Diario extends StatelessWidget {
  final String texto;

  Diario(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(texto),
      ),
    );
  }
}