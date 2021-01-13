import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'pergunta': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 9},
        {'texto': 'Amarelo ', 'pontuacao': 8},
        {'texto': 'Branco', 'pontuacao': 7}
      ]
    },
    {
      'pergunta': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Hamster', 'pontuacao': 10},
        {'texto': 'Pitbull', 'pontuacao': 9},
        {'texto': 'Coelho', 'pontuacao': 8},
        {'texto': 'Capivara', 'pontuacao': 7},
      ]
    },
    {
      'pergunta': 'Qual será o nome da caçula?',
      'respostas': [
        {'texto': 'Vitoria', 'pontuacao': 10},
        {'texto': 'Manuela', 'pontuacao': 0},
        {'texto': 'Virorina', 'pontuacao': 0},
        {'texto': 'Romirda', 'pontuacao': 0},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (existePerguntaSelecionada) {
      // setState chama toda a interface gráfica para ser reinderizada
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  bool get existePerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
                quandoResponder: _responder,
              )
            : Resultado(this._pontuacaoTotal, this._reiniciarQuestionario),
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
