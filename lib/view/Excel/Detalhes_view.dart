import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_valid/main.dart';

void main() {
  runApp(MaterialApp(
    home: Detalhes(),
  ));
}

class Detalhes extends StatefulWidget {
  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  final _formKey = GlobalKey<FormState>();
  bool _lotePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: degradeVerde(),
        title: Text('Detalhes do Produto'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Algo deu errado');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Carregando");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> produto = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(produto['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Preço: ${produto['price']}'),
                    Text('Quantidade: ${produto['quantity']}'),
                    Text('Lote: ${produto['quantity']}'),
                    Text('Descrição: ${produto['description']}'),
                     Text('Categoria: ${produto['category']}'),
                    Text('Codigo: ${produto['code']}'),
                    Text('Loja: ${produto['store']}'),
                    
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
