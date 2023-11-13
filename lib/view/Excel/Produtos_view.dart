import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_valid/controller/produtos_controller.dart';
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
                    child: Text('Adicionar Produtos', style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                  ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: ProdutoController().listar().snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(
                            child: Text('Não foi possível conectar.'),
                          );
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                          default:
                            final dados = snapshot.requireData;
                            if (dados.size > 0) {
                              return ListView.builder(
                                itemCount: dados.size,
                                itemBuilder: (context, index) {
                                  String id = dados.docs[index].id;
                                  dynamic item = dados.docs[index].data();
                                  return Card(
                                    child: ListTile(
                                      leading: Icon(Icons.description),
                                      title: Text(item['titulo']),
                                      subtitle: Text(item['descricao']),
                        ),
                      );
                    }
                  );
                }else {
                  return Center(
                    child: Text('Nenhum produto encontrada.'),
                  );
                }
                      }
                    }
                  ),

                      

       /*               return ListView(
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
                  ),*/
                  
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
           child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.green[800],
          )
      ),
    );
  }
}

/*StreamBuilder<QuerySnapshot>(
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
          subtitle: Text(data['category']),
        );
      }).toList(),
    );
  },
)*/
