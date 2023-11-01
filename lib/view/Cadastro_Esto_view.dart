import 'package:flutter/material.dart';
import 'package:projeto_valid/main.dart';

void main() {
  runApp(MaterialApp(
    home: CadastroEstoque(),
  ));
}

class CadastroEstoque extends StatefulWidget {
  @override
  _CadastroEstoqueState createState() => _CadastroEstoqueState();
}

class _CadastroEstoqueState extends State<CadastroEstoque> {
  final _formKey = GlobalKey<FormState>();
  bool _lotePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: degradeVerde(),
        title: Text('Cadastro de Estoque'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição do Produto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Código do Produto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código do produto';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Loja'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a loja';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Data de Validade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a data de validade';
                  }
                  return null;
                },
              ),
              TextFormField(
                enabled: _lotePressed,
                decoration: InputDecoration(labelText: 'Quantidade'),
                validator: (value) {
                  if (_lotePressed && (value == null || value.isEmpty)) {
                    return 'Por favor, insira a quantidade';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: _lotePressed
                        ? Icon(Icons.check_box)
                        : Icon(
                            Icons.check_box_outline_blank), // O ícone muda aqui
                    onPressed: () {
                      setState(() {
                        _lotePressed = !_lotePressed;
                      });
                    },
                  ),
                  SizedBox(
                      width:
                          10), // Você pode ajustar o espaço entre o ícone e o texto
                  Text('Lote'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processando Dados')));
                  }
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
