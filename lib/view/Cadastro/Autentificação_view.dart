import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_valid/controller/login_controller.dart';
import 'package:projeto_valid/main.dart';

class Autenticacao extends StatefulWidget {
  @override
  _AutenticacaoState createState() => _AutenticacaoState();
  var txtEmail = TextEditingController();
  var txtNome = TextEditingController();
  var txtPhone = TextEditingController();
  var txtSenha = TextEditingController();
  var txtID = TextEditingController();
  var txtCargo = TextEditingController();
  var txtSetor = TextEditingController();
  var txtLoja = TextEditingController();
}

class _AutenticacaoState extends State<Autenticacao> {
  List<String> Cargos = ['Funcionário Comum', 'Gerente'];
  String? CargoSelecionado = 'Funcionário Comum';
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: degradeVerde(),
        centerTitle: true,
        title: Text('Autenticação'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: _idController,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  decoration: const InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(50, 50)))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                  onChanged: (cargo) =>
                      setState(() => CargoSelecionado = cargo),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: 150,
                child: ElevatedButton(
                  onPressed: () async {
                    /* if (_formKey.currentState!.validate()) {
                      bool idExiste = await LoginController().verificarID(_idController.text);
                      if (idExiste) {
                        LoginController().autenticar(context, _idController.text, CargoSelecionado);*/
                    Navigator.pushNamed(context, 'login');
                    /* } 
                    //}*/
                  },
                  child: Text('Autenticar',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
