import 'package:flutter/material.dart';

class BotaoMensagem extends StatelessWidget {
  final VoidCallback funcao;

  const BotaoMensagem({Key? key, required this.funcao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: funcao,
      icon: const Icon(Icons.message),
      color: Colors.blue,
    );
  }
}