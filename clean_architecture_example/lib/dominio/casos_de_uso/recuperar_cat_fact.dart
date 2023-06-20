import 'package:novo_projeto/dados/modelos/cat_fact.dart';
import 'package:novo_projeto/dados/repositorios/repositorio_cat_fact.dart';
import 'package:novo_projeto/dominio/respositorio/repositorio.dart';

class RecuperarFatoDeGato {
  final Repositorio _repositorio;
  RecuperarFatoDeGato() : _repositorio = ReporsitorioDeFatoDeGato();

  Future<CatFact> call() async => await _repositorio.get();
}
