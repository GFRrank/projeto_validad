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
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _idController,
              decoration: const InputDecoration(
                labelText: 'ID',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                  borderSide: BorderSide(width: 0.5)
                )
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 10) {
                  return 'Por favor, insira um ID válido com 10 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _cargoController,
              decoration: const InputDecoration(
                labelText: 'cargo',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                  borderSide: BorderSide(width: 0.5)
                )
              ),
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
            const SizedBox(
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
