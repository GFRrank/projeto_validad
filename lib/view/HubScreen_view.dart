import 'package:flutter/material.dart';
import 'package:projeto_valid/view/Login_view.dart';
import 'package:projeto_valid/view/EsqueceuSenha_view.dart';
import 'package:projeto_valid/view/Cadastro_Func_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'hub_screen',
      routes: {
        'login': (context) => const LoginView(),
        'esqueceu_senha': (context) => EsqueceuSenhaView(),
        'hub_screen': (context) => const HubScreen(),
        'cadastro_func': (context) => CadastroFunc(), // Adicione esta linha
      
      },
    );
  }
}

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hub Screen'),
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
            ),
          ],
        ),
      ),
    );
  }
}
