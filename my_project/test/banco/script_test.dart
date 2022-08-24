import 'package:my_project/banco/script.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Teste script sqlite', () {
    test('A lista de comandos não pode ser vazio', () {
      var comandos = criandoBanco;
      expect(comandos.isNotEmpty, true);
    });

    test('A lista de comandos não pode ser nulo', () {
      var comandos = criandoBanco;
      expect(comandos, isNotNull);
    });

    test('A lista de comandos deve ser do tipo String', () {
      var comandos = criandoBanco;
      for (var comando in comandos) {
        expect(comando, isInstanceOf<String>());
      }
    });
  });
}
