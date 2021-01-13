import 'package:flutter/material.dart';
import './resultado.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = [
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
    if (existePerguntaSelecionada) {
      // setState chama toda a interface gráfica para ser reinderizada
      setState(() {
        _perguntaSelecionada++;
      });
    }
    print(_perguntaSelecionada);
  }

  bool get existePerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override // decorator
  Widget build(BuildContext context) {
    List<String> respostas = existePerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;
    // List<Widget> widgetsRespostas =
    //     respostas.map((e) => BtnResposta(e, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: existePerguntaSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['pergunta']),
                  ...respostas.map((e) => BtnResposta(e, _responder)).toList(),
                  // ...widgetsRespostas
                ],
              )
            : Resultado(),
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
