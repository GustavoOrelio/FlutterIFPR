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
    'UPDATE venda SET nomeProduto=?, valorProduto=?, formaPagamento=? WHERE id = ?';
    int linhasAfetadas = await _bancoDeDados.rawInsert(_sql, [
      venda.id,
      venda.nomeProduto,
      venda.valorProduto,
      venda.formaPagamento
    ]);
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
}