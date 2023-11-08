import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

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
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        flexibleSpace: degradeVerde(),
        centerTitle: true,
        title: const Text('Cadastro'),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              decoration: InputDecoration(labelText: 'Senha'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ElevatedButton(
              onPressed: () {
                
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