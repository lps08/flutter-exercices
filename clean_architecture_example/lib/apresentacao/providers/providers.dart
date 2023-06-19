import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novo_projeto/dados/modelos/cat_fact.dart';
import 'package:novo_projeto/dominio/casos_de_uso/recuperar_cat_fact.dart';

final catFactProvider = StateNotifierProvider<CatFactNotifier, CatFact>(
  (ref) => CatFactNotifier(),
);

class CatFactNotifier extends StateNotifier<CatFact> {
  RecuperarFatoDeGato recuperarFatoDeGato = RecuperarFatoDeGato();
  int atual = -1;
  List<CatFact> recuperados = [];

  CatFactNotifier()
      : super(
          CatFact(
            fact: 'Faça o download de um fato de gato!',
            length: 0,
          ),
        );

  void recuperarNovo() async {
    CatFact novo = await recuperarFatoDeGato();
    recuperados = [...recuperados, novo];
    atual++;
    state = novo;
  }

  void previous() {
    if (hasPrevious()) {
      atual--;
      state = recuperados.elementAt(atual);
    }
  }

  void next() {
    if (hasNext()) {
      atual++;
      state = recuperados.elementAt(atual);
    }
  }

  bool hasPrevious() => (atual > 0) ? true : false;
  bool hasNext() => (atual < recuperados.length - 1) ? true : false;

  List<CatFact> get todos => recuperados;
}
