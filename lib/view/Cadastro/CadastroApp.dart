import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controller/login_controller.dart';
import '../../main.dart';

class CadastroApp extends StatefulWidget {
  const CadastroApp({Key? key}) : super(key: key);

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

<<<<<<< HEAD
  List<String> cargos = ['Funcionário Comum', 'Gerente'];
  String? cargoSelecionado = 'Funcionário Comum';
=======
  List<String> Cargos = ['Funcionário Comum', 'Gerente'];
  String? CargoSelecionado = 'Funcionário Comum';
>>>>>>> c29ee9ceed72ee8841946b72de4aac400301e040

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
<<<<<<< HEAD
          _buildTextField('Nome', txtNome),
          _buildTextField('Telefone', txtPhone),
          _buildTextField('Email', txtEmail),
          _buildTextField('Senha', txtSenha, obscureText: true),
          _buildTextField('ID', txtID, obscureText: true),
          _buildDropdownButton(),
          _buildElevatedButton(),
=======
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
>>>>>>> c29ee9ceed72ee8841946b72de4aac400301e040
        ],
      ),
    );
  }
<<<<<<< HEAD

  Widget _buildTextField(String labelText, TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText),
        obscureText: obscureText,
      ),
    );
  }

  Widget _buildDropdownButton() {
    return SizedBox(
      width: 200,
      height: 60,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
        value: cargoSelecionado,
        items: cargos.map((cargo) => DropdownMenuItem(
          value: cargo,
          child: Text(cargo),
        )).toList(),
        onChanged: (cargo) => setState(() => cargoSelecionado = cargo),
      ),
    );
  }

  Widget _buildElevatedButton() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: ElevatedButton(
        onPressed: () {
          _criarConta();
          _autenticar();
          Navigator.pushReplacementNamed(context, 'Login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[800],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: const Text('Cadastrar', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
  void _autenticar() {
      LoginController().autenticar(
        context,
        txtCargo.text,
        txtID.text,
        txtPhone.text,
        txtLoja.text,
        txtSetor.text,
      );
    }
  void _criarConta() {
    LoginController().criarConta(
      context,
      txtNome.text,
      txtEmail.text,
      txtSenha.text,
    );
  }
=======
>>>>>>> c29ee9ceed72ee8841946b72de4aac400301e040
}
