
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

    test('Testando salvar', () async {
      var venda = Venda(nomeProduto: "Cimento", valorProduto: '25.00', formaPagamento: 'Cartão de crédito');
      var resultado = await vendasDAO.salvar(venda);
      expect(resultado, true);
    });

    test("Testando alterar", () async {
      var venda = Venda(id: 1, nomeProduto: "Cal", valorProduto: '12.00', formaPagamento: 'Dinheiro');
      var resultado = await vendasDAO.editar(venda);
      expect(resultado, true);
    });

    test('Testando excluir', () async {
      var resultado = await vendasDAO.excluir(1);
      expect(resultado, true);
    });

    test("Consultar venda", () async {
      var resultado = await vendasDAO.consultar(1);
      expect(resultado, isInstanceOf<Venda>());
    });


  });

}
