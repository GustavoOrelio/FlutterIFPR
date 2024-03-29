import 'package:calculadora/banco/sqlite/conexao.dart';
import 'package:calculadora/banco/sqlite/usuario.dart';
import 'package:calculadora/banco/sqlite/usuario_dao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late Database db;
  late UsuarioDAO UserDAO;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(caminho);
    db = await Conexao.abrir();
    UserDAO = UsuarioDAO();
  });

  tearDownAll(() {});

  group('Teste conexão', () {
    test('Verificar se a conexão está aberta', () {
      expect(db.isOpen, true);
    });

    test('Testar usario maior que 0', () async {
      var usuario = Usuario(nome: "Gustavo", senha: "123456");
      var resultado = await UserDAO.salvar(usuario);
      expect(resultado, true);
    });

  });

}
