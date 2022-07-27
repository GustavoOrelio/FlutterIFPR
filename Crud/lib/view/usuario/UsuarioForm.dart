import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioForm extends StatelessWidget{
  dynamic id;
  String? nome;
  String? sobre;

  UsuarioForm({Key? key}) : super(key: key);

  Future<int> salvar() async {
    String path = join(await getDatabasesPath(), 'banco.db');
    Database database = await openDatabase(path,version: 1);
    String sql;
    Future<int> linhasAfetadas;
    if(id == null){
      sql = 'INSERT INTO usuario (nome, sobre) VALUES (?,?)';
      linhasAfetadas = database.rawInsert(sql,[nome,sobre]);
    }else{
      sql = 'UPDATE usuario SET nome = ?, sobre =? WHERE id = ?';
      linhasAfetadas = database.rawUpdate(sql,[nome, sobre, id]);
    }
    return linhasAfetadas;
  }

  Widget _criarCampo(String rotulo, String? dica, ValueChanged<String>? vincularValor, String? valorInicial){
    return TextFormField(
      decoration: InputDecoration(
          label: Text(rotulo),
          hintText: dica
      ),
      onChanged: vincularValor,
      initialValue: valorInicial ??='',
    );
  }

  @override
  Widget build(BuildContext context){
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if(argumento != null){
      Map<String,Object?> usuario = argumento as Map<String,Object?>;
      id = usuario['id'] as int;
      nome = usuario['nome'] as String;
      sobre = usuario['sobre'] as String;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Usuario'),
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
                _criarCampo('Nome', 'Digite o nome do usuario', (valorDigitado) => nome = valorDigitado, nome ),
                _criarCampo('Sobre', 'Digite algo sobre o usuario', (valorDigitado) => sobre = valorDigitado, sobre),
              ]
          ),
        )
    );
  }
}