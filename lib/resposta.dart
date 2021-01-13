import 'package:flutter/material.dart';

class BtnResposta extends StatelessWidget {
  //
  final String resposta;
  final void Function() onSelecao;

  BtnResposta(this.resposta, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(this.resposta),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: this.onSelecao,
      ),
    );
  }
}
