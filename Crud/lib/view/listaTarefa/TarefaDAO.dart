import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TarefaDAO{
  dynamic id;
  String? nome;
  String? descricao;

  Future<List<Map<String, Object?>>> consultar() async {
    String path = join(await getDatabasesPath(), 'tarefa.db');
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
    return linhasAfetadas;
  }

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
      sql = 'UPDATE tarefa SET nome = ?, descricao =? WHERE id = ?';
      linhasAfetadas = database.rawUpdate(sql,[nome, descricao, id]);
    }
    return linhasAfetadas;
  }

}