import 'package:my_project/banco/conexao.dart';
import 'package:my_project/vendas/venda.dart';
import 'package:sqflite/sqflite.dart';

class VendaDAO {
  late Database _bancoDeDados;
  late String _sql;

  Future<bool> salvar(Venda venda) async {
    _bancoDeDados = await Conexao.abrir();
    _sql =
    'INSERT INTO venda(nomeProduto, valorProduto, formaPagamento) VALUES (?,?,?)';
    int linhasAfetadas = await _bancoDeDados.rawInsert(
        _sql, [venda.nomeProduto, venda.valorProduto, venda.formaPagamento]);
    return linhasAfetadas > 0;
  }

  Future<bool> editar(Venda venda) async {
    _bancoDeDados = await Conexao.abrir();
    _sql =
    'UPDATE venda SET nomeProduto = ?, valorProduto = ?, formaPagamento = ? WHERE id = ?';
    int linhasAfetadas = await _bancoDeDados.rawUpdate(
        _sql, [venda.nomeProduto, venda.valorProduto, venda.formaPagamento, venda.id]);
    return linhasAfetadas > 0;
  }

  Future<bool> excluir(int id) async {
    late Database bancoDeDados;
    try {
      const sql = 'DELETE FROM venda WHERE id = ?';
      bancoDeDados = await Conexao.abrir();
      int linhasAfetadas = await bancoDeDados.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('Metodo de exclusão');
    } finally {
      bancoDeDados.close();
    }
  }

  Future<Venda> consultar(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM venda WHERE id=?";
      db = await Conexao.abrir();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      Venda venda = Venda(
          id: resultado['id'] as int,
          nomeProduto: resultado['nomeProduto'].toString(),
          valorProduto: resultado['valorProduto'].toString(),
          formaPagamento: resultado['formaPagamento'].toString());
      return venda;
    } catch (e) {
      throw Exception('Método de consulta');
    } finally {
      db.close();
    }
  }

  @override
  Future<List> listarTodas() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM venda';
      db = await Conexao.abrir();
      List<Map<String, Object?>> resultado = (await db.rawQuery(sql));
      if (resultado.isEmpty) throw Exception('Sem registros');
      List venda = resultado.map((linha) {
        return Venda(
            id: linha['id'] as int,
            nomeProduto: linha['nomeProduto'].toString(),
            valorProduto: linha['valorProduto'].toString(),
            formaPagamento: linha['formaPagamento'].toString());
      }).toList();
      return venda;
    } catch (e) {
      throw Exception('Método listar');
    } finally {
      db.close();
    }
  }
}