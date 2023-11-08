import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  bool _notifications = true;
  String _language = 'Português';
  String _theme = 'Claro'; // Adicionei esta linha
  bool _lotePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // flexibleSpace: degradeVerde(), 
        title: Text('Configurações'),
      ),
      body: ListView(
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
                });
              },
            ),
          ),
          ListTile(
            title: Text('Tema do Aplicativo'),
            trailing: DropdownButton<String>(
              value: _theme, // Alterei esta linha
              items: <String>['Claro', 'Escuro']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _theme = newValue!; // Adicionei esta linha
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            child: Text('Sair'),
            onPressed: () {
              Navigator.pushNamed(context, 'inicio');
            },
          ),
        ],
      ),
    );
  }
}
