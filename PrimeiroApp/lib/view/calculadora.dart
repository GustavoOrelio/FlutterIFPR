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
          calculation(TextBotao);
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
                    text,
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

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(TextBotao) {
    if (TextBotao == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && TextBotao == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (TextBotao == '+' ||
        TextBotao == '-' ||
        TextBotao == 'x' ||
        TextBotao == '/' ||
        TextBotao == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = TextBotao;
      result = '';
    } else if (TextBotao == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (TextBotao == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (TextBotao == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + TextBotao;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

}
