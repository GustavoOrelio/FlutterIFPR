import 'package:calculadora/banco/sqlite/conexao.dart';
import 'package:calculadora/banco/sqlite/usuario.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDAO {
  late Database _db;
  late String _sql;

  Future<bool> salvar(Usuario usuario) async{
    _db = await Conexao.abrir();
    _sql = 'INSERT INTO usuario(nome, senha) VALUES (?,?)';
    int linhasAfetadas = await _db.rawInsert(_sql, [usuario.nome, usuario.senha]);
    return linhasAfetadas > 0;
  }
}
