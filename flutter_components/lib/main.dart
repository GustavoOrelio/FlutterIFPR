import 'package:flutter/material.dart';
import 'package:flutter_components/menu_dois.dart';
import 'package:flutter_components/menu_input.dart';
import 'package:flutter_components/menu_um.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenuInput(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen, shape: const StadiumBorder()),
                  onPressed: () {},
                  label: const Text(
                    'Cliente',
                    style: TextStyle(
                        fontFamily: 'Times',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  icon: const Icon(Icons.emoji_people, color: Colors.black87),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent, shape: const StadiumBorder()),
                  onPressed: () {},
                  label: const Text(
                    'Funcionario',
                    style: TextStyle(
                        fontFamily: 'Times',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  icon: const Icon(Icons.person, color: Colors.black87),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan, shape: const StadiumBorder()),
                  onPressed: () {},
                  label: const Text(
                    'Fornecedor',
                    style: TextStyle(
                        fontFamily: 'Times',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  icon: const Icon(Icons.production_quantity_limits,
                      color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
