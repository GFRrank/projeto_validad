import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  late final Stream<QuerySnapshot> _productsStream;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('Lendo da coleção products...');
    _productsStream = FirebaseFirestore.instance.collection('products').snapshots();
    print('Leitura concluída.');
  }

  void addProduct(String name, String category) {
    print('Adicionando produto...');
    FirebaseFirestore.instance.collection('products').add({
      'name': name,
      'expiryDate': Timestamp.fromDate(DateTime.now().add(Duration(days: category == 'Rebaixa' ? 30 : category == 'Atenção' ? 180 : 365))),
      'category': category,
    });
    print('Produto adicionado.');
  }

  Widget degradeVerde () {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 0, 117, 35).withOpacity(1.0),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
              const Color.fromARGB(255, 0, 255, 42).withOpacity(1.0),
            ],
          ),
        ),
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
            Form(
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
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addProduct(_nameController.text, _categoryController.text);
                      }
                    },
                    child: Text('Adicionar Produto'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StreamBuilder<QuerySnapshot>(
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
                          if (data['category'] == 'Rebaixa') {
                            return ListTile(
                              title: Text(data['name']),
                              subtitle: Text('Categoria: ${data['category']}'),
                            );
                          } else {
                            return Container();
                          }
                        }).toList(),
                      );
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
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
                          if (data['category'] == 'Atenção') {
                            return ListTile(
                              title: Text(data['name']),
                              subtitle: Text('Categoria: ${data['category']}'),
                            );
                          } else {
                            return Container();
                          }
                        }).toList(),
                      );
                    },
                  ),
                  StreamBuilder<QuerySnapshot>(
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
                          if (data['category'] == 'Seguro') {
                            return ListTile(
                              title: Text(data['name']),
                              subtitle: Text('Categoria: ${data['category']}'),
                            );
                          } else {
                            return Container();
                          }
                        }).toList(),
                      );
                    },
                  ),
                 
                ],
              ),
            ),
          ],
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