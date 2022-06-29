import 'package:flutter/material.dart';

class CalcularIdade extends StatelessWidget {
  String? nome;
  int? anoNascimento;

  mostrarResultado(String resultado, BuildContext context){
    showDialog(context: context, builder: (BuildContext){
      return AlertDialog(
        content: Text(resultado, style: TextStyle(fontSize: 50),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular Idade',

        ),

      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                label: Text('Nome:'), hintText: 'Digite o seu nome completo'),
            onChanged: (valorDigitado){
              nome = valorDigitado;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text('Data de Nascimento:'),
                hintText: 'Digite o ano em que nasceu'),
            onChanged: (valorDigitado){
              anoNascimento = int.parse(valorDigitado);
            }
          ),
          ElevatedButton(onPressed: () {
            var anoAtual = DateTime.now().year;
            var idade = anoAtual - anoNascimento!;
            mostrarResultado(idade.toString(), context);
          }, child: Text('Calcular Idade'))
        ],
      ),
    );
  }
}
