import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_valid/main.dart';

import '../../controller/login_controller.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  LoginController().login(
                  context,
                  _emailController.text,
                  _passwordController.text,
                  );
                },
                child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(height: 30),
            Row(              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [                
                const SizedBox(
                  child: Text('Nâo está cadastrado?'),
                ),
                TextButton(
                onPressed: () {                  
                  Navigator.pushReplacementNamed(context, 'Cadastro_App');
                },
                child: const Text('Cadastre-se', style: TextStyle(fontWeight: FontWeight.bold))
                ),
              ],
            ),
                TextButton(
                onPressed: () {                  
                  Navigator.pushReplacementNamed(context, 'esqueceu_senha');
                },
                child: const Text('Esqueceu a senha?', style: TextStyle(fontWeight: FontWeight.bold))
                ),
          ],
        ),
      ),
    );
  }
}
