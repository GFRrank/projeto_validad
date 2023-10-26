import 'package:flutter/material.dart';

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
          bottom: TabBar(
            tabs: [
              Tab(text: "Rebaixa", icon: Icon(Icons.arrow_downward, color: Colors.red)),
              Tab(text: "Atenção", icon: Icon(Icons.warning, color: Colors.yellow)),
              Tab(text: "Seguro", icon: Icon(Icons.check_circle, color: Colors.green)),
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
                  title: Text('Lote - Produto X (Código do produto)', style: TextStyle(color: Colors.red)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Loja - Serial da loja', style: TextStyle(color: Colors.red)),
                      Text('Estoque - Quantidade', style: TextStyle(color: Colors.red)),
                      Text('Data de validade - Data', style: TextStyle(color: Colors.red)),
                      Text('Dias Restantes - Dias', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Lote - Produto X (Código do produto)', style: TextStyle(color: Colors.yellow)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Loja - Serial da loja', style: TextStyle(color: Colors.yellow)),
                      Text('Estoque - Quantidade', style: TextStyle(color: Colors.yellow)),
                      Text('Data de validade - Data', style: TextStyle(color: Colors.yellow)),
                      Text('Dias Restantes - Dias', style: TextStyle(color: Colors.yellow)),
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Lote - Produto X (Código do produto)', style: TextStyle(color: Colors.green)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Loja - Serial da loja', style: TextStyle(color: Colors.green)),
                      Text('Estoque - Quantidade', style: TextStyle(color: Colors.green)),
                      Text('Data de validade - Data', style: TextStyle(color: Colors.green)),
                      Text('Dias Restantes - Dias', style: TextStyle(color: Colors.green)),
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
