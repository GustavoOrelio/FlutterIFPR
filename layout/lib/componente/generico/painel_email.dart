import 'package:flutter/material.dart';
import 'package:layout/componente/generico/botao_email.dart';

class PainelEmail extends StatelessWidget {
  final VoidCallback funcaoEmail;

  const PainelEmail({Key? key, required this.funcaoEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return SizedBox(
      width: largura/4,
      child: Row(
        children: [
          BotaoEmail(funcao: funcaoEmail),
        ],
      ),
    );
  }
}