import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  String tipo;
  String dica;

  Input({Key? key, required this.dica, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          label: Text(tipo),
      hintText: dica,
    ));
  }
}
