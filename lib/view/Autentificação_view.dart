import 'package:flutter/material.dart';
import 'package:projeto_valid/view/Login_view.dart';

class Autenticacao extends StatefulWidget {
  @override
  _AutenticacaoState createState() => _AutenticacaoState();
}

class _AutenticacaoState extends State<Autenticacao> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _cargoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Autenticação')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 10) {
                  return 'Por favor, insira um ID válido com 10 caracteres';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _cargoController,
              decoration: InputDecoration(labelText: 'Cargo'),
              validator: (value) {
                if (value == null ||
                    (value != 'FC' &&
                        value != 'G' &&
                        value != 'fc' &&
                        value != 'g')) {
                  return 'Por favor, insira um cargo válido ("Funcionario Comum" ou "Gerente")';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processando Dados')));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                }
              },
              child: Text('Autenticar'),
            ),
          ],
        ),
      ),
    );
  }
}
