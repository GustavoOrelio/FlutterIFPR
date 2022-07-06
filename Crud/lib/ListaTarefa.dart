import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListaTarefa extends StatelessWidget {
  Future<List<Map<String, Object?>>> buscarDados() async {
    String caminho = join(await getDatabasesPath(), 'banco.db');
    Database db = await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE tarefa(
          id INTEGER PRIMARY KEY,
          nome TEXT NOT NULL,
          descricao TEXT NOT NULL
          )
        ''');
        db.execute(
            'INSERT INTO tarefa(nome, descricao) VALUES ("Projeto", "Projeto WEB")');
        db.execute(
            'INSERT INTO tarefa(nome, descricao) VALUES ("Apresentação", "Apresentação em grupo")');
        db.execute(
            'INSERT INTO tarefa(nome, descricao) VALUES ("Lista", "Lista Exercicio")');
      },
    );
    List<Map<String, Object?>> lista =
        await db.rawQuery('SELECT * FROM tarefa');
    return lista;
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
      body: FutureBuilder(
        future: buscarDados(),
        builder: (context, AsyncSnapshot<List<Map<String, Object?>>> dadosFuturo){
          if(!dadosFuturo.hasData) return CircularProgressIndicator();
          var listaTarefa = dadosFuturo.data!;
          return ListView.builder(
            itemCount: listaTarefa.length,
            itemBuilder: (context, contador){
              var tarefa = listaTarefa[contador];
              return ListTile(
                title: Text(tarefa['nome'].toString()),
                subtitle: Text(tarefa['descricao'].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
