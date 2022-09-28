import 'package:flutter/material.dart';
import 'package:layout/componente/cartao_nome.dart';
import 'package:layout/componente/cartao_telefone.dart';
import 'package:layout/componente/meu_avatar.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(65),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: const [
          MeuAvatar(),
          CartaoNome(),
          CartaoTelefone()
        ],
      ),
    );
  }
}
