import 'package:flutter/material.dart';


class EsqueceuSenhaView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueceu a Senha'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Digite seu email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para enviar email de redefinição de senha
                String email = _emailController.text;
                // Implemente a lógica para enviar o email de redefinição de senha aqui
                // Você pode chamar uma API ou fazer qualquer outra ação necessária
                // após o usuário inserir seu email para redefinição de senha.
              },
              child: Text('Enviar Email de Redefinição'),
            ),
          ],
        ),
      ),
    );
  }
}
