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
    //
    List<Map<String, Object>> respostas = existePerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['pergunta']),
        ...respostas
            .map((resp) => BtnResposta(resp['texto'], responder))
            .toList(),
        // ...widgetsRespostas
      ],
    );
  }
}
