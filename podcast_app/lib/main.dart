import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PodcastHomePage(),
    );
  }
}

class PodcastHomePage extends StatelessWidget {
  const PodcastHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                const Stack(
                  children: [
                    Text('Hello Jahid'),
                    Text('Good Evening'),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none))
              ],
            ),
            const Row(
              children: [
                Text('Popular'),
                Text('Feature'),
                Text('Trending'),
              ],
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Stack(
                    children: [
                      Card(
                        child: Container(
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Text('Surviving Lakas'),
                                  Text('By Adam'),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.play_arrow))
                            ],
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/disc.jpg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Text('Recently played'),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/disc.jpg'),
                      ),
                      Column(
                        children: [
                          const Text('Life is beautiful'),
                          const Text('By Jamie L.'),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme:
              const IconThemeData(color: Colors.amber, size: 30.0),
          selectedFontSize: 15.0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.black,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              activeIcon: Icon(Icons.remove),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              activeIcon: Icon(Icons.remove),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag),
              label: 'fav',
              activeIcon: Icon(Icons.remove),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'seṭtings',
              activeIcon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
