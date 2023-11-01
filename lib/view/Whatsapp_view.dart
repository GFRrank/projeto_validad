import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_valid/main.dart';

class WhatsappView extends StatefulWidget {
  @override
  _WhatsappViewState createState() => _WhatsappViewState();
}

class _WhatsappViewState extends State<WhatsappView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: degradeVerde(),
        title: Text('WhatsApp'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
           await http.post(
              Uri.parse('https://api.whatsapp.com/send?phone=1234567890&text=Hello'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
            );
            // Analise a resposta da API e use os dados retornados em sua nova tela.
          },
          child: Text('Enviar mensagem no WhatsApp'),
        ),
      ),
    );
  }
}
