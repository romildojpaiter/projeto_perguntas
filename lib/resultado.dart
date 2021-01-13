import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  //
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    String frase;
    if (pontuacao < 15) {
      frase = "tá fraco";
    } else if (pontuacao < 15) {
      frase = "Tente novamente";
    } else if (pontuacao < 25) {
      frase = "Você merece palmas";
    } else {
      frase = "Ai Conhece";
    }
    return frase;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              fraseResultado,
              style: TextStyle(fontSize: 28),
            ),
          ),
          FlatButton(
            child: Text(
              'Reinciar?',
              style: TextStyle(fontSize: 18),
            ),
            textColor: Colors.blue,
            onPressed: quandoReiniciarQuestionario,
          )
        ],
      ),
    );
  }
}
