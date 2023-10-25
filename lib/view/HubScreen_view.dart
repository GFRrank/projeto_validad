import 'package:flutter/material.dart';
import 'package:projeto_valid/view/Login_view.dart';
import 'package:projeto_valid/view/EsqueceuSenha_view.dart';
import 'package:projeto_valid/view/Cadastro_Func_view.dart';
import 'package:projeto_valid/view/Cadastro_Esto_view.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'hub_screen',
      routes: {
        'login': (context) => const LoginView(),
        'esqueceu_senha': (context) => EsqueceuSenhaView(),
        'hub_screen': (context) => const HubScreen(),
        'cadastro_func': (context) => CadastroFunc(),
        'cadastro_estoque': (context) =>  CadastroEstoque(), 
      },
    );
  }
}

class HubScreen extends StatelessWidget {
  const HubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hub Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/gfrlogo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Menu'),
      ),
      ListTile(
        title: const Text('Cadastro Funcionários'),
        onTap: () {
          Navigator.pushNamed(context, 'cadastro_func');
        },
      ), // Adicione esta linha
      ListTile(
        title: const Text('Cadastro Estoque'),
        onTap: () {
          Navigator.pushNamed(context, 'cadastro_estoque');
        },
      ),
    ],
  ),
),    
    );
  }
}
