import 'package:flutter_test/flutter_test.dart';
import 'package:my_project/vendas/vendedor.dart';
import 'package:my_project/vendas/vendedor_DAO.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late VendedorDAO vendedoresDAO;
  late Vendedor vendedor;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'venda.db');
    deleteDatabase(caminho);
    vendedoresDAO = VendedorDAO();

    vendedor = Vendedor(nome: "Gustavo", telefone: '999999999', senha: '1234');
  });

  tearDownAll(() {});

  group('Testes de Vendedores', () {
    test('Testando salvar', () async {
      var vendedor =
          Vendedor(nome: "Gustavo", telefone: '999999999', senha: '1234');
      var resultado = await vendedoresDAO.salvar(vendedor);
      expect(resultado, true);
    });

    test("Testando alterar", () async {
      await vendedoresDAO.salvar(vendedor);
      var vendas = Vendedor(
          id: 1, nome: "Gustavo", telefone: '999999999', senha: '123456');
      var resultado = await vendedoresDAO.editar(vendas);
      expect(resultado, true);
    });

    test('Testando excluir', () async {
      await vendedoresDAO.salvar(vendedor);
      var resultado = await vendedoresDAO.excluir(1);
      expect(resultado, true);
    });

    test("Consultar vendedores", () async {
      await vendedoresDAO.salvar(vendedor);
      var resultado = await vendedoresDAO.consultar(1);
      expect(resultado, isInstanceOf<Vendedor>());
    });

    test("Listar todos vendedores", () async {
      await vendedoresDAO.salvar(vendedor);
      var resultado = await vendedoresDAO.listarTodos();
      expect(resultado, isInstanceOf<List<Vendedor>>());
    });
  });
}
