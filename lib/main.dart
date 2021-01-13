import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'pergunta': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'nota': 10},
        {'texto': 'Verde', 'nota': 9},
        {'texto': 'Amarelo ', 'nota': 8},
        {'texto': 'Branco', 'nota': 7}
      ]
    },
    {
      'pergunta': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Hamster', 'nota': 10},
        {'texto': 'Pitbull', 'nota': 9},
        {'texto': 'Coelho', 'nota': 8},
        {'texto': 'Capivara', 'nota': 7},
      ]
    },
    {
      'pergunta': 'Qual será o nome da caçula?',
      'respostas': [
        {'texto': 'Vitoria', 'nota': 10},
        {'texto': 'Manuela', 'nota': 0},
        {'texto': 'Virorina', 'nota': 0},
        {'texto': 'Romirda', 'nota': 0},
      ]
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: existePerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
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
