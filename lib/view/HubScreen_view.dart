import 'package:flutter/material.dart';
import 'package:projeto_valid/view/Login_view.dart';
import 'package:projeto_valid/view/EsqueceuSenha_view.dart';
import 'package:projeto_valid/view/CadastroFunc_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'hub_screen', // Defina a rota inicial como 'hub_screen'
      routes: {
        'login': (context) => LoginView(),
        'esqueceu_senha': (context) => EsqueceuSenhaView(),
        'hub_screen': (context) => HubScreen(),
        'cadastro_func': (context) => CadastroFuncView(), // Adicione a rota para CadastroFunc
      },
    );
  }
}

class HubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hub Screen'),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Navegar para a tela de adicionar foto
              Navigator.pushNamed(context, 'cadastro_func'); // Use o nome da rota para navegar
            },
            child: Text('Cadastrar Funcionários'),
          ),
        ],
      ),
    );
  }
}


class CadastroFuncView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Funcionários'),
        // Adicione um botão de volta à barra de aplicativos
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navegar de volta à tela anterior (HubScreen)
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Conteúdo para o cadastro de funcionários aqui.'),
      ),
    );
  }
}
