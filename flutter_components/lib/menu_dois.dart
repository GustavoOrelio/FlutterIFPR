import 'package:flutter/material.dart';
import 'package:flutter_components/components/botao.dart';
import 'package:flutter_components/menu_um.dart';

class MenuDois extends StatefulWidget {
  const MenuDois({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MenuDois> createState() => _MenuDoisState();
}

class _MenuDoisState extends State<MenuDois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Botao(
                acao: () => print("Cliente"),
                descricao: 'Cliente',
                color: Colors.lightGreen,
                icon: Icons.emoji_people,
              ),
              Botao(
                acao: () => print("Funcionario"),
                descricao: 'Funcionario',
                color: Colors.blueAccent,
                icon: Icons.person,
              ),
              Botao(
                acao: () => print("Fornecedor"),
                descricao: 'Fornecedor',
                color: Colors.cyan,
                icon: Icons.production_quantity_limits,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
