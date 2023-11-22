import 'package:flutter/material.dart';
import 'package:projeto_valid/view/Login/Login_view.dart';
import 'package:projeto_valid/main.dart';
import '../../controller/login_controller.dart';

class EsqueceuSenhaView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  EsqueceuSenhaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: degradeVerde(),
        centerTitle: true,
        title: Text('Esqueceu Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Digite seu email',
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            buildStyledButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildStyledButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: () {
        if (_emailController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Digite o email')),
          );
        } else {
          LoginController().esqueceuSenha(context, _emailController.text);
          Navigator.pushNamed(context, 'inicio');
        }
      },
      child: const Text('Enviar Email de Redefinição'),
    );
  }
}
