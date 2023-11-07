import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappView extends StatefulWidget {
  @override
  _WhatsappViewState createState() => _WhatsappViewState();
}

class _WhatsappViewState extends State<WhatsappView> {
  final TextEditingController _phoneController = TextEditingController();
  String _numPhone = "";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Número de celular',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('Enviar mensagem no WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    String numPhone="16991485653";
    Uri url = Uri.https("api.whatsapp.com", "send", {"phone": numPhone, "text": "Hello"});
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Não foi possível abrir $url';
    }
  }
}
