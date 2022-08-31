import 'package:my_project/banco/conexao.dart';
import 'package:my_project/vendas/vendedor.dart';
import 'package:sqflite/sqflite.dart';

class VendedorDAO {
  late Database _bancoDeDados;
  late String _sql;

  Future<bool> salvar(Vendedor vendedor) async {
    _bancoDeDados = await Conexao.abrir();
    _sql = 'INSERT INTO vendedor(nome, telefone, senha) VALUES (?,?,?)';
    int linhasAfetadas = await _bancoDeDados
        .rawInsert(_sql, [vendedor.nome, vendedor.telefone, vendedor.senha]);
    return linhasAfetadas > 0;
  }

  Future<bool> editar(Vendedor vendedor) async {
    _bancoDeDados = await Conexao.abrir();
    _sql = 'UPDATE vendedor SET nome = ?, telefone = ?, senha = ? WHERE id = ?';
    int linhasAfetadas = await _bancoDeDados.rawUpdate(
        _sql, [vendedor.nome, vendedor.telefone, vendedor.senha, vendedor.id]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluir(int id) async {
    late Database bancoDeDados;
    try {
      const sql = 'DELETE FROM vendedor WHERE id = ?';
      bancoDeDados = await Conexao.abrir();
      int linhasAfetadas = await bancoDeDados.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('Metodo de exclusão');
    } finally {
      bancoDeDados.close();
    }
  }

  Future<Vendedor> consultar(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM vendedor WHERE id=?";
      db = await Conexao.abrir();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Vendedor vendedor = Vendedor(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          telefone: resultado['telefone'].toString(),
          senha: resultado['senha'].toString());
      return vendedor;
    } catch (e) {
      throw Exception('Método de consulta');
    } finally {
      db.close();
    }
  }

  @override
  Future<List> listarTodos() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM vendedor';
      db = await Conexao.abrir();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List vendedor = resultado.map((linha) {
        return Vendedor(
            id: linha['id'] as int,
            nome: linha['nome'].toString(),
            telefone: linha['telefone'].toString(),
            senha: linha['senha'].toString());
      }).toList();
      return vendedor;
    } catch (e) {
      throw Exception('Método listar');
    } finally {
      db.close();
    }
  }
}
