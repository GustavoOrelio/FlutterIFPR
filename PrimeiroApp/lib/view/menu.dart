import 'package:flutter/material.dart';
import 'package:primeiro_app/view/calculadora.dart';
import 'package:primeiro_app/view/calcular_idade.dart';
import 'package:primeiro_app/view/hello_word.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  Widget criarBotao(String nomeBotao, VoidCallback? acaoBotao) {
    return ElevatedButton(onPressed: acaoBotao, child: Text(nomeBotao),  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Botões'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            criarBotao('Olá Mundo!', () => print('Hello word!!!'),),
            criarBotao(
                'Calcular Idade',
                () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CalcularIdade();
                    }))),
            criarBotao(
                'Hello Word',
                () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HelloWord();
                    }))),
            criarBotao(

                'Calculadora',
                () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Calculadora();
                    }))),
          ],
        ),
      ),
    );
  }


}
