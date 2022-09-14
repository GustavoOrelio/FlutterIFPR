import 'package:flutter/material.dart';
import 'package:flutter_components/components/input.dart';
import 'package:flutter_components/menu_dois.dart';
import 'package:flutter_components/menu_um.dart';

class MenuInput extends StatefulWidget {
  const MenuInput({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MenuInput> createState() => _MenuInputState();
}

class _MenuInputState extends State<MenuInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Input(dica: 'Insira o nome', tipo: 'Nome',),
              Input(dica: 'Insira o sobrenome', tipo: 'Sobrenome',),
            ],
          ),
        ),
      ),
    );
  }
}
