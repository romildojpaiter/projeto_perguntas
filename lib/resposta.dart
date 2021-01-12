import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;

  Resposta(this.resposta);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.resposta),
      onPressed: null,
    );
  }
}
