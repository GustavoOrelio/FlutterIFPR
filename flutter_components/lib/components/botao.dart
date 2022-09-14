import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  String descricao;
  Function acao;
  var icon;
  var color;

  Botao(
      {Key? key,
      required this.descricao,
      required this.acao,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: color, shape: const StadiumBorder()),
        onPressed: () {
          acao;
        },
        label: Text(
          descricao,
          style: const TextStyle(
              fontFamily: 'Times',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        icon:  Icon(icon, color: Colors.black87),
      ),
    );
  }
}
