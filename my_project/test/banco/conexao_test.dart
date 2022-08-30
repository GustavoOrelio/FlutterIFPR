import 'package:my_project/banco/conexao.dart';
import 'package:my_project/vendas/venda.dart';
import 'package:my_project/vendas/venda_dao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late Database bandoDedados;
  late VendaDAO vendasDAO;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'venda.db');
    deleteDatabase(caminho);
    bandoDedados = await Conexao.abrir();
    vendasDAO = VendaDAO();
  });

  group('Teste de conexão', () {
    test('Verificar se a conexão está aberta', () {
      expect(bandoDedados.isOpen, true);
    });

    test('Testar se a venda é maior que 0', () async {
      var venda = Venda(id: 1, nomeProduto: "Cimento", valorProduto: '25,00', formaPagamento: 'Dinheiro');
      var resultado = await vendasDAO.salvar(venda);
      expect(resultado, true);
    });

  });

}
