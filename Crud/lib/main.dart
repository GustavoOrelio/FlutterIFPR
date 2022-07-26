import 'package:crud/view/tarefa_form.dart';
import 'package:crud/view/tarefa_lista.dart';
import 'package:crud/view/tarefa_lista_dinamica.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' :(context) => const TarefaListaReativa(),
        '/tarefaForm' :(context) => TarefaForm()
      },
    );
  }
}


