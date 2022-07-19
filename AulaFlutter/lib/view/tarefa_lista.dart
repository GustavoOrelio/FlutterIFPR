import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TarefaLista extends StatelessWidget{
  const TarefaLista({Key? key}) : super(key: key);

  Future<List<Map<String,Object?>>> consultar2() async {
    String caminho = join(await getDatabasesPath(), 'banco.db');
    Database bd = await openDatabase( 
      caminho, 
      onCreate: (db, version) {
        db.execute('');
      },
    );

    List<Map<String,Object?>> dados = await bd.rawQuery('SELECT * FROM tarefa');
    return dados;
  }

  Future<List<Map<String, Object?>>> consultar() async {
    await Future.delayed(const Duration(seconds: 3));
    String path = join(await getDatabasesPath(), 'banco.db');
    //deleteDatabase(path);
    Database database = await openDatabase(
      path,
      version: 1, 
      onCreate: (db, v){
        db.execute('CREATE TABLE tarefa(id INTEGER PRIMARY KEY, nome TEXT, descricao TEXT)');
        db.execute('INSERT INTO tarefa(nome, descricao) VALUES("Projeto","Projeto Web")');
        db.execute('INSERT INTO tarefa(nome, descricao) VALUES("Apresentação","Apresentação em grupo")');
        db.execute('INSERT INTO tarefa(nome, descricao) VALUES("Lista","Lista Exercícios")');
      }, 
    );
    List<Map<String, Object?>> list = await database.rawQuery('SELECT * FROM tarefa');
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(
        title: const Text('Lista Tarefas'),
        actions: [ 
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/tarefaForm') )
        ],
      ),
      body: FutureBuilder(
        future:consultar(),
        builder: (context,  AsyncSnapshot<List<Map<String, Object?>>> snapshot){
          if(!snapshot.hasData) return const CircularProgressIndicator();
          var lista = snapshot.data!;
          return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, contador){
                var tarefa = lista[contador];
                return ListTile( 
                  title: Text(tarefa["nome"].toString()),
                  subtitle: Text(tarefa["descricao"].toString()),
                );
              }
          );
        }
      )
    );
  }
}
