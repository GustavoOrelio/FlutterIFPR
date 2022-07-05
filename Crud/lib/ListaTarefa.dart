import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListaTarefa extends StatelessWidget {
  buscarDados() async {
    String caminho = join(await getDatabasesPath(), 'banco.db');
    Database db = await openDatabase(caminho, onCreate: (db, version) {
      db.execute('''
          CREATE TABLE tarefa(
          id INT PRIMARY KEY,
          nome TEXT NOT NULL,
          descricao TEXT NOT NULL
          )
        ''');
      db.execute('INSERT INTO tarefa(nome, descricao) VALUES ()');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Lista de tarefas'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/formTarefa');
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
