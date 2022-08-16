import 'package:calculadora/banco/calculadora.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  late Calculadora calculadora;
  setUp(() {
    calculadora = Calculadora();
  });

  tearDown(() {

  });

  tearDownAll(() {

  });

  group('Teste somar', () {
    test('Teste da soma', (){
      var num1 = 10.0;
      var num2 = 15.0;
      var calculadora = Calculadora();
      var resultado = calculadora.somar(num1, num2);
      expect(resultado, 25.0);
    });

    test('Teste da soma com 1 numero negativo', (){
      var num1 = -10.0;
      var num2 = 15.0;
      var calculadora = Calculadora();
      var resultado = calculadora.somar(num1, num2);
      expect(resultado, 5.0);
    });
  });



}