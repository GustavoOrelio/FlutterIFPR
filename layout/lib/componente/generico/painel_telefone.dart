import 'package:flutter/material.dart';
import 'package:layout/componente/generico/botao_mensagem.dart';
import 'package:layout/componente/generico/botao_telefone.dart';

class PainelTelefone extends StatelessWidget {
  final VoidCallback funcaoTelefone;
  final VoidCallback funcaoMensagem;

  const PainelTelefone({Key? key, required this.funcaoMensagem, required this.funcaoTelefone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    return SizedBox(
      width: largura/4,
      child: Row(
        children: [
          BotaoTelefone(funcao: funcaoTelefone),
          BotaoMensagem(funcao: funcaoMensagem)
        ],
      ),
    );
  }
}
