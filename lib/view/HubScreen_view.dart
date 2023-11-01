import 'package:flutter/material.dart';
import 'package:projeto_valid/main.dart';

class HubScreen extends StatelessWidget {
  const HubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: degradeVerde(),
        centerTitle: true,
        title: const Text('Hub Screen', style: TextStyle(fontSize: 23)),
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
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 0, 117, 35).withOpacity(1.0),
                    Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
                    Color.fromARGB(255, 0, 255, 42).withOpacity(1.0),
                  ],
                ),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: const BoxDecoration(
                          
                      image: DecorationImage(
                        image: AssetImage('assets/gfrlogo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Adicione espaço entre a imagem e o texto
                  Text('Menu', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
            ListTile(
              title: const Text('Cadastro Funcionários', style: TextStyle(fontSize: 18)), // Aumente o tamanho do texto aqui
              onTap: () {
                Navigator.pushNamed(context, 'cadastro_func');
              },
            ), 
            SizedBox(height: 10), // Adicione espaço entre os itens
            ListTile(
              title: const Text('Cadastro Estoque', style: TextStyle(fontSize: 18)), // Aumente o tamanho do texto aqui
              onTap: () {
                Navigator.pushNamed(context, 'cadastro_estoque');
              },
            ), 
            SizedBox(height: 10), // Adicione espaço entre os itens
            ListTile(
              title: const Text('Estoque', style: TextStyle(fontSize: 18)), // Aumente o tamanho do texto aqui
              onTap: () {
                Navigator.pushNamed(context, 'produtos');
              },
            ), 
            SizedBox(height: 10), // Adicione espaço entre os itens
            ListTile(
              title: const Text('Configurações', style: TextStyle(fontSize: 18)), // Aumente o tamanho do texto aqui
              onTap: () {
                Navigator.pushNamed(context, 'configuraçoes');
              },
            ), 
            SizedBox(height: 10), // Adicione espaço entre os itens
            ListTile(
              title: const Text('Sobre', style: TextStyle(fontSize: 18)), // Aumente o tamanho do texto aqui
              onTap: () {
                Navigator.pushNamed(context, 'sobre');
              },
            ), 
             ListTile(
              title: const Text('Excel', style: TextStyle(fontSize: 18)), // Aumente o tamanho do texto aqui
              onTap: () {
                Navigator.pushNamed(context, 'excel');
              },
            ), 
             ListTile(
              title: const Text('Whatsapp', style: TextStyle(fontSize: 18)), // Aumente o tamanho do texto aqui
              onTap: () {
                Navigator.pushNamed(context, 'whatsapp');
              },
            ),   
          ],
        ),
      ),    
    );
  }
}
