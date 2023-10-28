import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp _emailRegExp =
      RegExp(r'^[a-zA-Z0-9_#%$.]+@(hotmail|outlook|gmail)+.com$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50),
            const Icon(
              Icons.account_circle,
              size: 180,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              textAlign: TextAlign.left,
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
  onPressed: () {
    String email = _emailController.text;
    bool isEmailValid = _emailRegExp.hasMatch(email);
    String password = _passwordController.text;

    if (password.length < 8) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content:
                const Text('A senha deve ter pelo menos 8 caracteres.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (password == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content:
                const Text('Por favor, insira uma senha.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed:
                    () {
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
        builder:
            (BuildContext context) {
          return AlertDialog(
            title:
                const Text('Erro'),
            content:
                const Text('Por favor, insira um email válido.'),
            actions:
                <Widget>[
              TextButton(
                child:
                    const Text('OK'),
                onPressed:
                    () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  },
  child: const Text('Login'),
),

          ],
        ),
      ),
    );
  }
}
