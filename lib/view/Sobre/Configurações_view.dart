import 'package:flutter/material.dart';
import 'package:projeto_valid/main.dart';
import '../../controller/login_controller.dart';

//import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Importe o arquivo gerado pelo Flutter Intl

class Config extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  bool _notifications = true;
  String _language = 'Português';
  String _theme = 'Claro'; 
  bool _lotePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: degradeVerde(), 
         title: const Text(
          "Configurações",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text('Notificações'),
            trailing: Switch(
              value: _notifications,
              onChanged: (bool value) {
                setState(() {
                  _notifications = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Idioma'),
            trailing: DropdownButton<String>(
              value: _language,
              items: <String>['Português', 'Inglês']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _language = newValue!;
                  // Atualize o idioma do aplicativo
                 // AppLocalizations.load(Locale(_language));
                });
              },
            ),
          ),
          ListTile(
            title: Text('Tema do Aplicativo'),
            trailing: DropdownButton<String>(
              value: _theme, 
              items: <String>['Claro', 'Escuro']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _theme = newValue!; 
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 120,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom( backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
              child: Text('Sair', style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                 LoginController().logout();
                Navigator.pushNamed(context, 'inicio');
              },
            ),
          ),
        ],
      ),
    );
  }
}
