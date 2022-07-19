import 'package:flutter/material.dart';
import 'package:flutter_crud_mvc/view/tarefa_form.dart';
import 'package:flutter_crud_mvc/view/tarefa_lista.dart';

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
        '/' :(context) => const TarefaLista(),
        '/tarefaForm' :(context) => TarefaForm()
      },
    );
  }
}


