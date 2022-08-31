
import 'package:flutter_test/flutter_test.dart';
import 'package:my_project/vendas/venda.dart';
import 'package:my_project/vendas/venda_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late VendaDAO vendasDAO;
  late Venda venda;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'venda.db');
    deleteDatabase(caminho);
    vendasDAO = VendaDAO();

     venda = Venda(nomeProduto: "Cimento", valorProduto: '25.00', formaPagamento: 'Cartão de crédito');
  });

  tearDownAll(() {});

  group('Testes de Vendas', () {

    test('Testando salvar', () async {
      var venda = Venda(nomeProduto: "Cimento", valorProduto: '25.00', formaPagamento: 'Cartão de crédito');
      var resultado = await vendasDAO.salvar(venda);
      expect(resultado, true);
    });

    test("Testando alterar", () async {
      await vendasDAO.salvar(venda);
      var vendas = Venda(id: 1, nomeProduto: "Cal", valorProduto: '12.00', formaPagamento: 'Dinheiro');
      var resultado = await vendasDAO.editar(vendas);
      expect(resultado, true);
    });

    test('Testando excluir', () async {
      await vendasDAO.salvar(venda);
      var resultado = await vendasDAO.excluir(1);
      expect(resultado, true);
    });

    test("Consultar venda", () async {
      await vendasDAO.salvar(venda);
      var resultado = await vendasDAO.consultar(1);
      expect(resultado, isInstanceOf<Venda>());
    });

    test("Listar todas vendas", () async {
      await vendasDAO.salvar(venda);
      var resultado = await vendasDAO.listarTodas();
      expect(resultado, isInstanceOf<List<Venda>>());
    });

  });

}
