import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> perguntas = [
    {
      'pergunta': 'Qual a sua cor favorita?',
      'respostas': ['Azul', 'Verde', 'Amarelo ', 'Branco']
    },
    {
      'pergunta': 'Qual o seu animal favorito?',
      'respostas': ['Hamster', 'Pitbull', 'Coelho', 'Capivara']
    }
  ];

  void _responder() {
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
    List<String> respostas = perguntas[_perguntaSelecionada]['respostas'];
    // List<Widget> widgetsRespostas =
    //     respostas.map((e) => BtnResposta(e, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['pergunta']),
            ...respostas.map((e) => BtnResposta(e, _responder)).toList(),
            // ...widgetsRespostas
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
