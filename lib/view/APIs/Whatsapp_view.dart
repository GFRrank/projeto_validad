import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappView extends StatefulWidget {
  @override
  _WhatsappViewState createState() => _WhatsappViewState();
}

class _WhatsappViewState extends State<WhatsappView> {
  final _phoneController = TextEditingController();
  String numPhone = "";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(11)],
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Número de telefone',
                ),
              ),
            ),    
            ElevatedButton(
              onPressed: _launchURL,
              child: const Text('Enviar mensagem no WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    String numPhone = _phoneController.text;
    Uri url = Uri.https("api.whatsapp.com", "send", {"phone": numPhone, "text": "Big Dick"});
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Não foi possível abrir $url';
    }
  }
}
