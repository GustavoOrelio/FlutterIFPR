import 'package:flutter/material.dart';

class HelloWord extends StatelessWidget {

  String? nome;

  mostrarTexto(String texto, BuildContext context){
    showDialog(context: context, builder: (BuildContext){
      return AlertDialog(
        content: Text("Hello Word " + texto, style: TextStyle(fontSize: 18),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Word'),
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
          ElevatedButton(onPressed: () {

            mostrarTexto(nome.toString(), context);
          }, child: Text('Imprimir Texto'))
        ],
      ),
    );
  }
}
