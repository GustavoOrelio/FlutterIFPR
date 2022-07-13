import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FormTarefa extends StatelessWidget {
  Future<int> salvar(String nome, String descricao, [int? id]) async {
    String caminho = join(await getDatabasesPath(), 'tarefa.db');
    Database banco = await openDatabase(caminho, version: 1);

    String sql;
    Future<int> linhasAfetadas;
    if (id == null) {
      sql = 'INSERT INTO tarefa (nome, descricao) VALUES (?, ?)';
      linhasAfetadas = banco.rawInsert(sql, [nome, descricao]);
    } else {
      sql = 'UPDATE tarefa SET nome = ?, descricao = ? WHERE id = ?';
      linhasAfetadas = banco.rawUpdate(sql, [nome, descricao, id]);
    }
    return linhasAfetadas;
  }

  Future<int> deletar(int id) async {
    String caminho = join(await getDatabasesPath(), 'tarefa.db');
    Database banco = await openDatabase(caminho, version: 1);
    String sql = "DELETE FROM tarefa WHERE id = ?";
    Future<int> linhaAfetada;
    linhaAfetada = banco.rawDelete(sql, [id]);
    return linhaAfetada;
  }



  @override
  Widget build(BuildContext context) {
    String? nome;
    String? descricao;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Cadastro de tarefas'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                label: Text('Nome'), hintText: 'Informe o nome da tarefa'),
            onChanged: (valorDigitado) => nome = valorDigitado,
          ),
          TextFormField(
            decoration: InputDecoration(
                label: Text('Descrição'), hintText: 'Informe a descrição da tarefa'),
            onChanged: (valorDigitado) => descricao = valorDigitado,
          ),

          FlatButton(
            color: Colors.black87,
            textColor: Colors.white,
            child: Text('Salvar'),
            onPressed: () {
                salvar(nome!, descricao!);
                Navigator.pushNamed(context, '/');

               //Para salvar precisa pegar o que foi preenchido nos dois campos e salvar;
            },
          ),


        ],
      ),
    );
  }
}
