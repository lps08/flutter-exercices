import 'package:flutter/material.dart';
import 'expandable_floating_action_button.dart';

@immutable
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () => debugPrint('Teste'),
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () => debugPrint('Teste'),
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () => debugPrint('Teste'),
            icon: const Icon(Icons.videocam),
          ),
        ],
      ),
    );
  }
}
