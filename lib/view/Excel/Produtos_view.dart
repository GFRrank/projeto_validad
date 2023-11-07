import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_valid/main.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    home: Produtos(),
  ));
}

class Produtos extends StatefulWidget {
  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance.collection('products').snapshots();

  void addProduct(String name, String category) {
    FirebaseFirestore.instance.collection('products').add({
      'name': name,
      'expiryDate': Timestamp.fromDate(DateTime.now().add(Duration(days: category == 'Rebaixa' ? 30 : category == 'Atenção' ? 180 : 365))),
      'category': category,
    });
  }

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
          title: const Text('Produtos'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _productsStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Algo deu errado');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Carregando");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['name']),
                  subtitle: Text('Categoria: ${data['category']}'),
                );
              }).toList(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addProduct('Nome do Produto', 'Rebaixa'), // Altere esses valores conforme necessário.
          tooltip: 'Adicionar Produto',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
