import 'package:flutter/material.dart';
import 'package:projeto_valid/main.dart';

void main() {
  runApp(MaterialApp(
    home: Produtos(),
  ));
}

class Produtos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          flexibleSpace: degradeVerde(),
          bottom: const TabBar(
            tabs: [
              Tab(
                  text: "Rebaixa",
                  icon: Icon(Icons.arrow_downward, color: Colors.red)),
              Tab(
                  text: "Atenção",
                  icon: Icon(Icons.warning, color: Colors.yellow)),
              Tab(
                  text: "Seguro",
                  icon: Icon(Icons.check_circle, color: Colors.green)),
            ],
          ),
          title: Text('Estoque'),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.red,
                  title: Text('Lote - Produto X (Código do produto)',
                      style: TextStyle(color: Colors.black)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Loja - Serial da loja',
                          style: TextStyle(color: Colors.black)),
                      Text('Estoque - Quantidade',
                          style: TextStyle(color: Colors.black)),
                      Text('Data de validade - Data',
                          style: TextStyle(color: Colors.black)),
                      Text('Dias Restantes - Dias',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.yellow,
                  title: Text('Lote - Produto X (Código do produto)',
                      style: TextStyle(color: Colors.black)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Loja - Serial da loja',
                          style: TextStyle(color: Colors.black)),
                      Text('Estoque - Quantidade',
                          style: TextStyle(color: Colors.black)),
                      Text('Data de validade - Data',
                          style: TextStyle(color: Colors.black)),
                      Text('Dias Restantes - Dias',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Color.fromARGB(255, 4, 255, 0),
                  title: Text('Lote - Produto X (Código do produto)',
                      style: TextStyle(color: Colors.black)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Loja - Serial da loja',
                          style: TextStyle(color: Colors.black)),
                      Text('Estoque - Quantidade',
                          style: TextStyle(color: Colors.black)),
                      Text('Data de validade - Data',
                          style: TextStyle(color: Colors.black)),
                      Text('Dias Restantes - Dias',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
