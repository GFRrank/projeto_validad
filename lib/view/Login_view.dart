import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_valid/main.dart';


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
        flexibleSpace: degradeVerde(),
        title: const Text('Login'),
      ),
      
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            const Icon(
              Icons.account_circle,
              size: 180,
              color: Colors.green,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _emailController,
                 decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50))
                    )
                  ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50))
                    )
                  ),
                textAlign: TextAlign.left,
                obscureText: true,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 150,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                ),
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
                child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
