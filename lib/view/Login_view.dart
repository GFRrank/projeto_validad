import 'package:flutter/material.dart';
import 'package:projeto_valid/view/EsqueceuSenha_view.dart';
import 'package:projeto_valid/view/HubScreen_view.dart';  // Importe a tela HubScreen

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final RegExp _emailRegExp =
      RegExp(r'^[a-zA-Z0-9_#%$.]+@(hotmail|outlook|gmail)+.com$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Icon(
              Icons.account_circle,
              size: 180,
              color: Colors.blue,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              textAlign: TextAlign.left,
              obscureText: true,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                bool isEmailValid = _emailRegExp.hasMatch(email);
                String password = _passwordController.text;

                if (password == '') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erro'),
                        content: Text('Por favor, insira uma senha.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (isEmailValid) {
                  // Lógica de autenticação aqui

                  // Após a autenticação bem-sucedida, redirecione para HubScreen
                  Navigator.pushReplacementNamed(context, 'hub_screen');
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erro'),
                        content: Text('Por favor, insira um email válido.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            // Adicione um botão "Esqueceu a senha?"
            TextButton(
              onPressed: () {
                // Navegue diretamente para a tela "Esqueceu Senha"
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EsqueceuSenhaView();
                }));
              },
              child: Text('Esqueceu a senha?'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: LoginView()));
