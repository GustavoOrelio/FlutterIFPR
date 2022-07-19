import 'package:crud/FormTarefa.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListaTarefa extends StatelessWidget {
  Future<List<Map<String, Object?>>> buscarDados() async {
    String caminho = join(await getDatabasesPath(), 'tarefa.db');
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
              padding: EdgeInsets.only(left: 15),
              onPressed: () {
                Navigator.pushNamed(context, '/formTarefa');
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/usuario');
              },
              icon: Icon(Icons.account_circle))
        ],
      ),
      body: FutureBuilder(
        future: buscarDados(),
        builder:
            (context, AsyncSnapshot<List<Map<String, Object?>>> dadosFuturo) {
          if (!dadosFuturo.hasData) return CircularProgressIndicator();
          var listaTarefa = dadosFuturo.data!;
          return ListView.builder(
            itemCount: listaTarefa.length,
            itemBuilder: (context, contador) {
              var tarefa = listaTarefa[contador];
              return ListTile(
                title: Text(tarefa['nome'].toString()),
                subtitle: Text(tarefa['descricao'].toString()),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/formTarefa',
                              arguments: tarefa);
                        },
                        icon: Icon(Icons.edit),
                        color: Colors.green,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                      "Tem certeza que deseja excluir? Obs. Está ação não pode ser desfeita"),
                                  actions: [
                                    ElevatedButton(
                                      child: Text("Sim"),
                                      onPressed: () {
                                        FormTarefa form = new FormTarefa();
                                        form.deletar(
                                            int.parse(tarefa['id'].toString()));
                                        Navigator.pushNamed(context, '/');
                                      },
                                    ),
                                    ElevatedButton(
                                      child: Text("Não"),
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/');
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
