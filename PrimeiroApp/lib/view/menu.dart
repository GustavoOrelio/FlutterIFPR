import 'package:flutter/material.dart';
import 'package:primeiro_app/view/calcular_idade.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  Widget criarBotao(String nomeBotao, VoidCallback? acaoBotao) {
    return ElevatedButton(onPressed: acaoBotao, child: Text(nomeBotao));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botões'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            criarBotao('Olá Mundo!', () => print('Hello word!!!')),
            criarBotao(
                'Calcular Idade',
                () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CalcularIdade();
                    }))),
            criarBotao(
                'Hello Word', () => print('Você clicou no terceiro botão')),
            criarBotao(
                'Calculadora', () => print('Você clicou no quarto botão')),
          ],
        ),
      ),
    );
  }
}
