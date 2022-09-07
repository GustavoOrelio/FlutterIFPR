import 'package:crud/view/listaTarefa/TarefaDAO.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TarefaListaReativa extends StatefulWidget {
  const TarefaListaReativa({Key? key, this.TarefaDAO}) : super(key: key);

  final TarefaDAO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista Tarefas'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => Navigator.pushNamed(context, '/tarefaForm').then((value){

                }))
          ],
        ),
        body: FutureBuilder(
            future: TarefaDAO.consultar(),
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

                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              color: const Color(0xffff0000),
                              onPressed: () {
                                TarefaDAO.excluir(tarefa['id'] as int);
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}



