
import 'package:flutter_test/flutter_test.dart';
import 'package:my_project/vendas/juros.dart';

void main(){
  late Juros juros;
  setUp(() {
    juros = Juros();
  });

  group('Teste juros produtos', () {
    test('Teste do calculo', (){
      var valorProduto = 20.0;
      var porcentagem = 10.0;
      var juros = Juros();
      var resultado = juros.calcular(valorProduto, porcentagem);
      expect(resultado, 22.0);
    });


  });



}