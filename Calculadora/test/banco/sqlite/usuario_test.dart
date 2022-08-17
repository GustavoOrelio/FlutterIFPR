import 'package:calculadora/banco/sqlite/usuario.dart';
import 'package:calculadora/banco/sqlite/usuario_dao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late UsuarioDAO DAOUsuario;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(caminho);
    DAOUsuario = UsuarioDAO();
  });

  tearDownAll(() {});

  group('Teste Salvar', () {

    test('Testar usuario maior que 0', () async {
      var usuario = Usuario(nome: "Gustavo", senha: "123456");
      var resultado = await DAOUsuario.salvar(usuario);
      expect(resultado, true);
    });

  });

}
