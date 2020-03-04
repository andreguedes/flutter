import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final IconData icone;
  final String rotulo;
  final String dica;

  Editor({this.controlador, this.icone, this.rotulo, this.dica});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica),
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}