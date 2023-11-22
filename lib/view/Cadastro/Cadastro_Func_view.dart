import 'package:flutter/material.dart';
import 'package:projeto_valid/main.dart';


void main() {
  runApp(MaterialApp(
    home: CadastroFunc(),
  ));
}

class CadastroFunc extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  CadastroFunc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: degradeVerde(),
        title: const Text('Formulário'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right:20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ID',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu ID.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu telefone.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Loja',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a loja.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Cargo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o cargo.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Setor',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o setor.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom( backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
                          Text('Processando Dados')));
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
