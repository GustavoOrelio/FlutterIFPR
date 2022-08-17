import 'package:calculadora/banco/sqlite/conexao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  late Database db;

  setUp(() async{
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(caminho);
    db = await Conexao.abrir();
  });

  tearDownAll(() {

  });

  group('Teste conexão', () {
    test('Verificar se a conexão está aberta', () {
      expect(db.isOpen, true);
    });
  });
}
