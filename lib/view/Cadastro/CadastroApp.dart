import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controller/login_controller.dart';
import '../../main.dart';
import 'package:projeto_valid/view/Cadastro/Autentifica%C3%A7%C3%A3o_view.dart';

class CadastroApp extends StatefulWidget {
  const CadastroApp({super.key});
  @override
  _CadastroAppState createState() => _CadastroAppState();
}

class _CadastroAppState extends State<CadastroApp> {
  var txtEmail = TextEditingController();
  var txtNome = TextEditingController();
  var txtPhone = TextEditingController();
  var txtSenha = TextEditingController();
  var txtID = TextEditingController();
  var txtCargo = TextEditingController();
  var txtSetor = TextEditingController();
  var txtLoja = TextEditingController();

  List<String> Cargos = ['Funcionário Comum', 'Gerente'];
  String? CargoSelecionado = 'Funcionário Comum';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              inputFormatters: [LengthLimitingTextInputFormatter(11)],
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
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              controller: txtID,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              decoration: InputDecoration(
                labelText: 'ID',
              ),
              obscureText: false,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 60,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              value: CargoSelecionado,
              items: Cargos.map((cargo) => DropdownMenuItem(
                    value: cargo,
                    child: Text(cargo),
                  )).toList(),
              onChanged: (cargo) => setState(() => CargoSelecionado = cargo),
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
                  txtID.text,
                  txtPhone.text,
                  txtLoja.text,
                  txtCargo.text,
                  txtSetor.text,
                );
                Navigator.pushReplacementNamed(context, 'Login');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: const Text('Cadastrar',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
