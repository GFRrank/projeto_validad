import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Autenticacao extends StatefulWidget {
  @override
  _AutenticacaoState createState() => _AutenticacaoState();
}
class _AutenticacaoState extends State<Autenticacao> {
  List<String> Cargos = ['Funcionário Comum', 'Gerente'];
  String? CargoSelecionado = 'Funcionário Comum';
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  //final _cargoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 0, 117, 35).withOpacity(1.0),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(1.0),
              const Color.fromARGB(255, 0, 255, 42).withOpacity(1.0),
            ],
          ),
          ),
          child: const Text('Autenticação'),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _idController,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],

                decoration: const InputDecoration(
                  labelText: 'ID',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(50, 50))
                  )
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Por favor, insira um ID válido com 10 caracteres';
                  }
                  return null;
                },
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
                      borderSide: BorderSide(color: Colors.blue),
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
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processando Dados')));
                    Navigator.pushNamed(context, 'login');
                  }
                },
                child: Text('Autenticar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
