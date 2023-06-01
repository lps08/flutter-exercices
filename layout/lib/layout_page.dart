import 'package:flutter/material.dart';
import 'expandable_floating_action_button.dart';

const TextStyle mainTextStyle = TextStyle(
  fontFamily: 'Marker Felt',
  height: 1.0,
);

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
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/pic.png'),
                  radius: 80.0,
                ),
                Stack(
                  alignment: const AlignmentDirectional(1.0, -2.5),
                  children: [
                    Text(
                      'Olá',
                      style: mainTextStyle.copyWith(
                          fontSize: 40.0,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withBlue(230)),
                    ),
                    Text(
                      'Ziraldo!',
                      style: mainTextStyle.copyWith(
                          fontSize: 80.0,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Parabéns! Esse mês você fez',
                  style: TextStyle(fontSize: 30.0),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      size: 40.0,
                    ))
              ],
            ),
            const Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoButton(
                    count: 12,
                    title: 'novos pedidos',
                    icon: Icons.store_sharp,
                  ),
                  InfoButton(
                    count: 20,
                    icon: Icons.people,
                    title: 'novos clientes',
                  ),
                  InfoButton(
                    count: 20,
                    icon: Icons.business_outlined,
                    title: 'novas cidades',
                  ),
                ],
              ),
            ),
            const Text('R\$ em pedidos'),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Home'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.store),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.people),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.line_axis),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.count,
    required this.icon,
    required this.title,
  });

  final int count;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.only(bottom: 20.0),
      onPressed: () {},
      child: SizedBox(
        height: 135,
        width: 100,
        child: Stack(
          children: [
            Positioned(
              top: 15,
              right: 0,
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Icon(
                icon,
                size: 60.0,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Positioned(
              bottom: 8,
              width: 100,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Marker Felt',
                    height: 1.0,
                    color: Theme.of(context).colorScheme.primary.withBlue(230)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
