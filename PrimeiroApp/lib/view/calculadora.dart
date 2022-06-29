import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

    );
  }
}
class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  dynamic displaytxt = 20;
  Widget botaoCalculadora(String TextBotao, Color? corBotao, Color corTexto) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculadora(TextBotao);
        },
        child: Text(
          TextBotao,
          style: TextStyle(
            fontSize: 30,
            color: corTexto,
          ),
        ),
        shape: CircleBorder(),
        color: corBotao,
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Display da calculadora
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    texto,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botaoCalculadora('AC', Colors.grey, Colors.black),
                botaoCalculadora('+/-', Colors.grey, Colors.black),
                botaoCalculadora('%', Colors.grey, Colors.black),
                botaoCalculadora('/', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botaoCalculadora('7', Colors.grey[850], Colors.white),
                botaoCalculadora('8', Colors.grey[850], Colors.white),
                botaoCalculadora('9', Colors.grey[850], Colors.white),
                botaoCalculadora('x', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botaoCalculadora('4', Colors.grey[850], Colors.white),
                botaoCalculadora('5', Colors.grey[850], Colors.white),
                botaoCalculadora('6', Colors.grey[850], Colors.white),
                botaoCalculadora('-', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botaoCalculadora('1', Colors.grey[850], Colors.white),
                botaoCalculadora('2', Colors.grey[850], Colors.white),
                botaoCalculadora('3', Colors.grey[850], Colors.white),
                botaoCalculadora('+', Colors.amber[700], Colors.white),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.fromLTRB(20, 15, 135, 15),
                    shape: StadiumBorder(),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    color: Colors.grey[850]),
                botaoCalculadora('.', Colors.grey[850], Colors.white),
                botaoCalculadora('=', Colors.amber[700], Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  dynamic texto = '0';
  double primeiroNumero = 0;
  double segundoNumero = 0;

  dynamic resultado = '';
  dynamic resultadoFinal = '';
  dynamic operacao = '';
  dynamic preOperacao = '';
  void calculadora(TextBotao) {
    if (TextBotao == 'AC') {
      texto = '0';
      primeiroNumero = 0;
      segundoNumero = 0;
      resultado = '';
      resultadoFinal = '0';
      operacao = '';
      preOperacao = '';
    } else if (operacao == '=' && TextBotao == '=') {
      if (preOperacao == '+') {
        resultadoFinal = add();
      } else if (preOperacao == '-') {
        resultadoFinal = sub();
      } else if (preOperacao == 'x') {
        resultadoFinal = mul();
      } else if (preOperacao == '/') {
        resultadoFinal = div();
      }
    } else if (TextBotao == '+' ||
        TextBotao == '-' ||
        TextBotao == 'x' ||
        TextBotao == '/' ||
        TextBotao == '=') {
      if (primeiroNumero == 0) {
        primeiroNumero = double.parse(resultado);
      } else {
        segundoNumero = double.parse(resultado);
      }

      if (operacao == '+') {
        resultadoFinal = add();
      } else if (operacao == '-') {
        resultadoFinal = sub();
      } else if (operacao == 'x') {
        resultadoFinal = mul();
      } else if (operacao == '/') {
        resultadoFinal = div();
      }
      preOperacao = operacao;
      operacao = TextBotao;
      resultado = '';
    } else if (TextBotao == '%') {
      resultado = primeiroNumero / 100;
      resultadoFinal = doesContainDecimal(resultado);
    } else if (TextBotao == '.') {
      if (!resultado.toString().contains('.')) {
        resultado = resultado.toString() + '.';
      }
      resultadoFinal = resultado;
    } else if (TextBotao == '+/-') {
      resultado.toString().startsWith('-')
          ? resultado = resultado.toString().substring(1)
          : resultado = '-' + resultado.toString();
      resultadoFinal = resultado;
    } else {
      resultado = resultado + TextBotao;
      resultadoFinal = resultado;
    }
    setState(() {
      texto = resultadoFinal;
    });
  }

  String add() {
    resultado = (primeiroNumero + segundoNumero).toString();
    primeiroNumero = double.parse(resultado);
    return doesContainDecimal(resultado);
  }

  String sub() {
    resultado = (primeiroNumero - segundoNumero).toString();
    primeiroNumero = double.parse(resultado);
    return doesContainDecimal(resultado);
  }

  String mul() {
    resultado = (primeiroNumero * segundoNumero).toString();
    primeiroNumero = double.parse(resultado);
    return doesContainDecimal(resultado);
  }

  String div() {
    resultado = (primeiroNumero / segundoNumero).toString();
    primeiroNumero = double.parse(resultado);
    return doesContainDecimal(resultado);
  }

  String doesContainDecimal(dynamic resultado) {
    if (resultado.toString().contains('.')) {
      List<String> splitDecimal = resultado.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return resultado = splitDecimal[0].toString();
    }
    return resultado;
  }

}
