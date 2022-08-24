
import 'package:flutter_test/flutter_test.dart';
import 'package:my_project/vendas/venda.dart';
import 'package:my_project/vendas/venda_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late VendaDAO vendasDAO;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'venda.db');
    deleteDatabase(caminho);
    vendasDAO = VendaDAO();
  });

  tearDownAll(() {});

  group('Testes de Vendas', () {

    test('Testando o salvar', () async {
      var venda = Venda(nomeProduto: "Cimento", valorProduto: '25.00', formaPagamento: 'Cartão de crédito');
      var resultado = await vendasDAO.salvar(venda);
      expect(resultado, true);
    });

    test('Testando o editar', () async {
      var venda = Venda(id: 1, nomeProduto: "Cimento", valorProduto: '25.00', formaPagamento: 'Dinheiro');
      var resultado = await vendasDAO.editar(venda);
      expect(resultado, true);
    });

  });

}
