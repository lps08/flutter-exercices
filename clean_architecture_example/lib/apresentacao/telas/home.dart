import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novo_projeto/apresentacao/providers/providers.dart';
import 'package:novo_projeto/apresentacao/widgets/fact_card.dart';

class CatFactsHome extends ConsumerWidget {
  const CatFactsHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: FactCard(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: ref.read(catFactProvider.notifier).hasPrevious()
                    ? () => ref.read(catFactProvider.notifier).previous()
                    : null,
                icon: const Icon(Icons.skip_previous),
                label: const Text('Anterior'),
              ),
              ElevatedButton.icon(
                onPressed: (ref.read(catFactProvider.notifier).hasNext())
                    ? () => ref.read(catFactProvider.notifier).next()
                    : null,
                icon: const Icon(Icons.skip_next),
                label: const Text('Próximo'),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () {
          ref.read(catFactProvider.notifier).recuperarNovo();
        },
      ),
    );
  }
}
