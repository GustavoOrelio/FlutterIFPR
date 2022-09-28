import 'package:flutter/material.dart';
import 'package:layout/componente/generico/avatar.dart';

class MeuAvatar extends StatelessWidget {
  const MeuAvatar({Key? key}) : super(key: key);
  final String urlImage = 'https://cdn.pixabay.com/photo/2022/09/19/15/19/meerkat-7465819_960_720.jpg';
  // final String urlImage = '';

  @override
  Widget build(BuildContext context) {
    return Avatar(urlImagem: urlImage);
     
  }
}
