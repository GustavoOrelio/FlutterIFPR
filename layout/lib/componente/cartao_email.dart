import 'package:flutter/material.dart';
import 'package:layout/componente/generico/painel_email.dart';
import 'package:url_launcher/url_launcher.dart';

class CartaoEmail extends StatelessWidget {
  const CartaoEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('E-mail: '),
        subtitle: const Text('oreliogustavo@gmail.com'),
        trailing: PainelEmail(
          funcaoEmail: chamarEmail,
        ),
      ),
    );
  }

  chamarEmail(){
    launchUrl(Uri(scheme: 'sms', path: 'oreliogustavo@gmail.com'));
  }

}
