import 'package:my_project/banco/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao{
  static Database? _bancoDeDados;

  static Future<Database> abrir() async{
    if (_bancoDeDados == null){
      String caminho = join(await getDatabasesPath(), 'venda.db');
      _bancoDeDados = await openDatabase(
        caminho,
        version: 1,
        onCreate: (db, version){
          for (var comando in criandoBanco){
            db.execute(comando);
          }
        },
      );
    }
    return _bancoDeDados!;
  }
}