import 'package:calculadora/banco/sqlite/script.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  setUp((){});
  tearDown(() {});
  tearDownAll(() {});

  group('Teste script sqlite', () {
    test('A lista de comandos não pode ser vazio', () {
      var comandos = criarBanco;
      expect(comandos.isNotEmpty, true);
    });

    test('A lista de comandos não pode ser nulo', () {
      var comandos = criarBanco;
      expect(comandos, isNotNull);
    });

    test('A lista de comandos deve ser do tipo String', () {
      var comandos = criarBanco;
      for(var comando in comandos){
        expect(comando, isInstanceOf<String>());
      }
    });
  });
}