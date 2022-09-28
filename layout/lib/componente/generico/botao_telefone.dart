import 'package:flutter/material.dart';

class BotaoTelefone extends StatelessWidget {
  final VoidCallback funcao;

  const BotaoTelefone({Key? key, required this.funcao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: funcao,
      icon: const Icon(Icons.phone),
      color: Colors.blue,
    );
  }
}
