import 'package:flutter/material.dart';
import 'package:layout/componente/generico/painel_telefone.dart';
import 'package:url_launcher/url_launcher.dart';

class CartaoTelefone extends StatelessWidget {
  const CartaoTelefone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Telefone: '),
        subtitle: const Text('(44) 9 9828-3686'),
        trailing: PainelTelefone(
          funcaoTelefone: chamarTelefone,
          funcaoMensagem: chamarMensagem,
        ),
      ),
    );
  }

  chamarTelefone(){
    launchUrl(Uri(scheme: 'tel', path: '(44) 9 9999-9999'));
  }

  chamarMensagem(){
    launchUrl(Uri(scheme: 'sms', path: '(44) 9 9999-9999'));
  }

}
