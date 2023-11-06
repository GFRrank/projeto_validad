import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappView extends StatefulWidget {
  @override
  _WhatsappViewState createState() => _WhatsappViewState();
}

class _WhatsappViewState extends State<WhatsappView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text('Enviar mensagem no WhatsApp'),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://api.whatsapp.com/send?phone=993160784&text=Hello';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir $url';
    }
  }
}
