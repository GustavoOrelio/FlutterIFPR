import 'package:crud/FormTarefa.dart';
import 'package:crud/ListaTarefa.dart';
import 'package:crud/Usuario.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' : (context) => ListaTarefa(),
        '/formTarefa' : (context) => FormTarefa(),
        '/usuario' : (context) => Usuario()
      }
    );
  }
}
