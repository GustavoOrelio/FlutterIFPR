import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Usuario extends StatelessWidget {
  Future<List<Map<String, Object?>>> buscarUsuario() async {
    String caminho = join(await getDatabasesPath(), 'usuario.db');
    Database db = await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE usuario(
          id INTEGER PRIMARY KEY,
          nome TEXT NOT NULL,
          sobre TEXT NOT NULL
          )
        ''');
        db.execute(
            'INSERT INTO usuario(nome, sobre) VALUES ("Gustavo Orelio", "Estudante de Engenharia de Software.")');
      },
    );
    List<Map<String, Object?>> lista =
        await db.rawQuery('SELECT * FROM usuario');
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Usuário'),
      ),
      body: FutureBuilder(
        future: buscarUsuario(),
        builder: (context, AsyncSnapshot<List<Map<String, Object?>>> dadosFuturo){
          if(!dadosFuturo.hasData) return CircularProgressIndicator();
          var listaUsuario = dadosFuturo.data!;
          return ListView.builder(
            itemCount: listaUsuario.length,
            itemBuilder: (context, contador){
              var usuario = listaUsuario[contador];
              return ListTile(
                title: Text(usuario['nome'].toString()),
                subtitle: Text(usuario['sobre'].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
