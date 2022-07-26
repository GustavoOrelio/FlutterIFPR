import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TarefaLista extends StatelessWidget{
  const TarefaLista({Key? key}) : super(key: key);

  Future<List<Map<String, Object?>>> consultar() async {
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

  Future<int> excluir(int id) async {
    String path = join(await getDatabasesPath(), 'banco.db');
    Database database = await openDatabase(path,version: 1);
    int linhasAfetadas = await database.rawDelete('DELETE FROM tarefa WHERE id = ?',[id]);
    return linhasAfetadas;
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
                  trailing: SizedBox(  
                    width: 100,
                    child: Row(  
                      children: [  
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: const Color(0xffb74093),
                          onPressed: (){
                            Navigator.pushNamed(context, '/tarefaForm', arguments: tarefa);
                          },
                        ),
                         
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: const Color(0xffff0000),
                          onPressed: (){
                            excluir(tarefa['id'] as int);
                          },
                        )
                      ],
                    ),
                  ),
                );
              }
          );
        }
      )
    );
  }
}
