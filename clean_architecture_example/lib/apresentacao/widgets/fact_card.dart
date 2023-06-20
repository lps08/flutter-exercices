import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novo_projeto/apresentacao/providers/providers.dart';
import 'package:novo_projeto/dados/modelos/cat_fact.dart';

class FactCard extends ConsumerWidget {
  const FactCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CatFact catFact = ref.watch(catFactProvider);

    TextStyle aStyle = const TextStyle(
      fontSize: 20,
    );

    return Card(
      child: ListTile(
        title: Text(
          '"${catFact.fact}"',
          style: aStyle,
        ),
        subtitle: Text(
          '${catFact.length} caracteres',
          style: aStyle,
        ),
      ),
    );
  }
}
