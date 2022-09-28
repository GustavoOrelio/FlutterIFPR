import 'package:flutter/material.dart';

class BotaoEmail extends StatelessWidget {
  final VoidCallback funcao;

  const BotaoEmail({Key? key, required this.funcao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: funcao,
      icon: const Icon(Icons.email),
      color: Colors.blue,
    );
  }
}