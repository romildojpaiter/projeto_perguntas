import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  bool get existePerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    List<String> respostas = existePerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;
    // List<Widget> widgetsRespostas =
    //     respostas.map((e) => BtnResposta(e, _responder)).toList();

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['pergunta']),
        ...respostas.map((e) => BtnResposta(e, responder)).toList(),
        // ...widgetsRespostas
      ],
    );
  }
}
