import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TarefaListaReativa extends StatefulWidget {
  const TarefaListaReativa({Key? key}) : super(key: key);

  @override
  State<TarefaListaReativa> createState() => _TarefaListaReativaState();
}

class _TarefaListaReativaState extends State<TarefaListaReativa> {
  Future<List<Map<String, Object?>>> consultar() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    //deleteDatabase(path);
    Database database = await openDatabase(
      path,
      version: 1,
    );
    List<Map<String, Object?>> list =
    await database.rawQuery('SELECT * FROM tarefa');
    return list;
  }

  Future<int> excluir(int id) async {
    String path = join(await getDatabasesPath(), 'banco.db');
    Database database = await openDatabase(path, version: 1);
    int linhasAfetadas =
    await database.rawDelete('DELETE FROM tarefa WHERE id = ?', [id]);
    setState((){});
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
                onPressed: () => Navigator.pushNamed(context, '/tarefaForm').then((value){
                  setState((){});
                }))
          ],
        ),
        body: FutureBuilder(
            future: consultar(),
            builder:
                (context, AsyncSnapshot<List<Map<String, Object?>>> snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              var lista = snapshot.data!;
              return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, contador) {
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
                              color: const Color(0xff058600),
                              onPressed: () {
                                Navigator.pushNamed(context, '/tarefaForm',
                                    arguments: tarefa)
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              color: const Color(0xffff0000),
                              onPressed: () {
                                excluir(tarefa['id'] as int);
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
