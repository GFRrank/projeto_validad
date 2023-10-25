import 'package:flutter/material.dart';
import 'package:projeto_valid/view/Login_view.dart';

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
        'login': (context) => const LoginView(),
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
        title: const Text('Tela Inicial'),
      ),
      body: Stack(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.purple.withOpacity(0.5),
                  Colors.deepPurple.withOpacity(0.5),
                  Colors.blue[900]!.withOpacity(0.5),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200.0, // Defina a altura desejada aqui
                  width: 200.0, // Defina a largura desejada aqui
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/gfrlogo.png.'), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: ElevatedButton(
                    child: const Text('Iniciar'),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
