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

class _ProdutosState extends State<Produtos> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();

  void addProduct(String name, String category) {
    FirebaseFirestore.instance.collection('products').add({
      'name': name,
      'expiryDate': Timestamp.fromDate(DateTime.now().add(Duration(days: category == 'Rebaixa' ? 30 : category == 'Atenção' ? 180 : 365))),
      'category': category,
    });
  }

  void deleteProduct(String id) {
    FirebaseFirestore.instance.collection('products').doc(id).delete();
  }

  Widget buildListView(AsyncSnapshot<QuerySnapshot> snapshot, String category) {
    if (snapshot.hasError) {
      return Text('Algo deu errado');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return Text("Carregando");
    }

    return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        if (data['category'] == category) {
          return ListTile(
            title: Text(data['name']),
            subtitle: Text('Categoria: ${data['category']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteProduct(document.id),
            ),
          );
        } else {
          return Container();
        }
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          flexibleSpace: degradeVerde(),
          bottom: TabBar(
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
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('products').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return buildListView(snapshot, 'Rebaixa');
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('products').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return buildListView(snapshot, 'Atenção');
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('products').snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return buildListView(snapshot, 'Seguro');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Adicionar Produto'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Nome do Produto'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o nome do produto';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _categoryController,
                        decoration: InputDecoration(labelText: 'Categoria'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira a categoria';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Adicionar'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addProduct(_nameController.text, _categoryController.text);
                        _nameController.clear();
                        _categoryController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              );
            },
          ),
          tooltip: 'Adicionar Produto',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.green[800],
        ),
      ),
    );
  }
}
