import 'package:flutter/material.dart';
import 'package:projeto_valid/view/Login/Login_view.dart';
import 'package:projeto_valid/main.dart';


class EsqueceuSenhaView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  EsqueceuSenhaView({super.key});

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
              decoration: const InputDecoration(labelText: 'Digite seu email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
          
            ElevatedButton(
              style: ElevatedButton.styleFrom( backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                // Lógica para enviar email de redefinição de senha
                String email = _emailController.text;
                // Implemente a lógica para enviar o email de redefinição de senha aqui
                // Você pode chamar uma API ou fazer qualquer outra ação necessária
                // após o usuário inserir seu email para redefinição de senha.
              },
              child: const Text('Enviar Email de Redefinição'),
            ),
          ],
        ),
      ),
    );
  }
}
