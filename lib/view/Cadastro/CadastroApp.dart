import 'package:flutter/material.dart';
import '../../controller/login_controller.dart';
import '../../main.dart';

class CadastroApp extends StatefulWidget {
  const CadastroApp({super.key});
  @override
  _CadastroAppState createState() => _CadastroAppState();
}

/*void Caixar() async {
  List<String> DadosCadastrais = ['Nome', 'Telefone', 'Email', 'Senha'];
  List<Widget> CaixasDeTexto = [];
  int i = 0;
    for (var DadosCadastrais in DadosCadastrais) {
      Padding(
        padding: EdgeInsets.all(0),
        child: TextField(
          decoration: InputDecoration(labelText: DadosCadastrais[i]),
        ),
      );
    i++;
  }
}
*/
class _CadastroAppState extends State<CadastroApp> {
  var txtEmail = TextEditingController();
  var txtNome = TextEditingController();
  var txtPhone = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        flexibleSpace: degradeVerde(),
        centerTitle: true,
        title: const Text('Cadastro'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: txtNome,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: txtPhone,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: txtEmail,
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: txtSenha,
              decoration: InputDecoration(labelText: 'Senha',),
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ElevatedButton(
              onPressed: () {
                LoginController().criarConta(
                  context,
                  txtNome.text,
                  txtEmail.text,
                  txtSenha.text,
                );
                Navigator.pushReplacementNamed(context, 'Login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
              ),
              child: const Text('Cadastrar', style: TextStyle(fontWeight: FontWeight.bold)),
              
            ),
          ),
        ],
      ),
    );
  }
}