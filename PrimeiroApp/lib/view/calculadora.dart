import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('1'),
            ],
          ),
          Row(
            children: [
              Text('2'),
            ],
          ),
        ],
      ),
    );
  }
}
