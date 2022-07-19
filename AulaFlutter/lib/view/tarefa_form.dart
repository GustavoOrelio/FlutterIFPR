import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class TarefaForm extends StatelessWidget{
  dynamic id;
  String? nome;
  String? descricao;

  TarefaForm({Key? key}) : super(key: key);

  Future<int> salvar() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    //deleteDatabase(path);
    Database database = await openDatabase(path,version: 1);
    String sql;
    Future<int> linhasAfetadas;
    if(id == null){
      sql = 'INSERT INTO tarefa (nome, descricao) VALUES (?,?)';
      linhasAfetadas = database.rawInsert(sql,[nome,descricao]);
    }else{
      sql = 'UPDATE estado SET nome = ?, descricao =? WHERE id = ?';
      linhasAfetadas = database.rawUpdate(sql,[nome, descricao, id]);
    }
    return linhasAfetadas;
  }

  Widget _criarCampo(String rotulo, String? dica, ValueChanged<String>? vincularValor){
    return TextFormField(  
      decoration: InputDecoration(  
        label: Text(rotulo),
        hintText: dica
      ),
      onChanged: vincularValor,
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(   
      appBar: AppBar(  
        title: const Text('Cadastro Tarefa'),
        actions: [ 
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: (){
              salvar();
              Navigator.pop(context);
            }
          ), 
        ],
      ),
      body:Form(  
        child: Column(
          children: [
            _criarCampo('Nome', 'Digite seu nome', (valorDigitado) => nome = valorDigitado),
            _criarCampo('Descrição', 'Descreva a tarefa', (valorDigitado) => descricao = valorDigitado),
          ]
        ),
      )
    );
  }
}