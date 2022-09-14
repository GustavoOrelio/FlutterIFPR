import 'package:flutter/material.dart';

class MenuUm extends StatefulWidget {
  const MenuUm({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MenuUm> createState() => _MenuUmState();
}

class _MenuUmState extends State<MenuUm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: centralizar(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            criarBotao(
                descricao: 'Cliente',
                acao: cliqueCliente,
                icon: Icons.emoji_people,
                color: Colors.lightGreen),
            criarBotao(
                descricao: 'Funcionario',
                acao: cliqueFuncionario,
                icon: Icons.person,
                color: Colors.blueAccent),
            criarBotao(
                descricao: 'Fornecedor',
                acao: cliqueFornecedor,
                icon: Icons.production_quantity_limits,
                color: Colors.cyan),
          ],
        ),
      ),
    );
  }

  Widget centralizar(Widget coluna) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(child: coluna),
    );
  }

  void cliqueCliente() {
    print('Cliente aqui');
  }

  void cliqueFuncionario() {
    print('Funcionario aqui');
  }

  void cliqueFornecedor() {
    print('Fornecedor aqui');
  }

  Widget criarBotao(
      {required String descricao,
      required Function acao,
      required icon,
      required color}) {
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
          style: TextStyle(
              fontFamily: 'Times',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        icon: Icon(icon, color: Colors.black87),
      ),
    );
  }
}
