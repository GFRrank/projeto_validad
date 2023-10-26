import 'package:flutter/material.dart';


void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'inicio',
      routes: {
        'inicio': (context) => const Inicio(),
      },
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tela Inicial',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 22, 49, 22),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 117, 35).withOpacity(1.0),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
              Color.fromARGB(255, 0, 255, 42).withOpacity(1.0),
            ],
          ),
        ),
        padding: EdgeInsets.only(
          top: 200,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/gfrlogo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green[800]!)), // Define a cor do botão aqui
                child: const Text('Iniciar'),
                onPressed: () {
                  Navigator.pushNamed(context, 'autent');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
