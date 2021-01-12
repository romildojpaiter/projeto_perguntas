import 'package:flutter/material.dart';
import './questao.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<String> perguntas = [
    'Qual a sua cor favorita?',
    'Qual o seu animal favorito?'
  ];

  void responder() {
    // setState chama toda a interface gráfica para ser reinderizada
    setState(() {
      if (_perguntaSelecionada < (perguntas.length - 1)) {
        _perguntaSelecionada++;
      } else {
        _perguntaSelecionada--;
      }
    });
    print(_perguntaSelecionada);
  }

  @override // decorator
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: () => responder(),
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: responder,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
