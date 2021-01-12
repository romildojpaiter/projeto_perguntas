import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  void responder() {
    print('Pergunta Respondida');
  }

  @override // decorator
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual a sua cor favorita?',
      'Qual o seu animal favorito'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Text(perguntas[0]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: () => responder(),
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: () {
                print('Resposta 2');
              },
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: () => print('Responda 3'),
            ),
          ],
        ),
      ),
    ); //MaterialApp
  }
}
