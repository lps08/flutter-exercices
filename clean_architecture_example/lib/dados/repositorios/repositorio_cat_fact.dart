import 'package:novo_projeto/dados/fontes_de_dados/fonte_remota_cat_fact.dart';
import 'package:novo_projeto/dados/modelos/cat_fact.dart';
import 'package:novo_projeto/dominio/respositorio/repositorio.dart';

class ReporsitorioDeFatoDeGato extends Repositorio<CatFact> {
  ReporsitorioDeFatoDeGato({super.fonteRemota = const FonteRemotaDeCatFact()});
}
