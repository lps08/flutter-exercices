import 'package:flutter/material.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

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
    final controller = ScrollController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Stack(
                      alignment: Alignment(-0.95, -2.0),
                      children: [
                        Text(
                          'Hello Luciano',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Good Evening! 👋',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: const MaterialStatePropertyAll(CircleBorder()),
                      side: MaterialStatePropertyAll(
                        BorderSide(color: Colors.grey.shade300),
                      ),
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(12.0)),
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      size: 30.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular ❤️‍🔥',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 310,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    enlargeFactor: 0.25,
                  ),
                  items: const [
                    PodcastCard(),
                    PodcastCard(),
                    PodcastCard(),
                  ],
                ),
              ),
              const Text(
                'Recently Played',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: FadingEdgeScrollView.fromSingleChildScrollView(
                  child: SingleChildScrollView(
                    controller: controller,
                    scrollDirection: Axis.vertical,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PodcastListItem(),
                        PodcastListItem(),
                        PodcastListItem(),
                        PodcastListItem(),
                        PodcastListItem(),
                        PodcastListItem(),
                        PodcastListItem(),
                        PodcastListItem(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          elevation: 0.0,
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

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const PodcastAvatar(
                podcastAvatarPath: 'assets/pic.png',
                radius: 180,
              ),
              const SizedBox(
                height: 60.0,
              ),
              const Text(
                'Why Won\'t You Date Me?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'By Nicole K.',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              ProgressBar(
                progress: const Duration(milliseconds: 1000),
                total: const Duration(milliseconds: 5000),
                barCapShape: BarCapShape.round,
                progressBarColor: Colors.amber,
                baseBarColor: Colors.amber.shade50,
                thumbColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 2,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.flag,
              size: 40.0,
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.skip_previous_rounded,
              size: 40.0,
            ),
            label: 'previous',
          ),
          BottomNavigationBarItem(
            icon: IconButton.filled(
              iconSize: 80.0,
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
              ),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber),
              ),
            ),
            label: 'play',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.skip_next_rounded,
              size: 40.0,
            ),
            label: 'next',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud_download_sharp,
              size: 40.0,
            ),
            label: 'download',
          ),
        ],
      ),
    );
  }
}

class PodcastListItem extends StatelessWidget {
  const PodcastListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: PodcastAvatar(
            podcastAvatarPath: 'assets/pic.png',
            radius: 45.0,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        const Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Life is beautiful',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'By Jamie L.',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: OutlinedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlayPage(),
              ),
            ),
            style: ButtonStyle(
                padding: const MaterialStatePropertyAll(EdgeInsets.all(12.0)),
                shape: const MaterialStatePropertyAll(CircleBorder()),
                side: MaterialStatePropertyAll(
                    BorderSide(color: Colors.grey.shade300))),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.amber,
              size: 25.0,
            ),
          ),
        ),
      ],
    );
  }
}

class PodcastCard extends StatelessWidget {
  const PodcastCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 85, right: 20.0),
      child: Stack(
        alignment: const AlignmentDirectional(0.0, -7.5),
        children: [
          Card(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 115.0,
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: 300.0,
                decoration: BoxDecoration(
                  color: Colors.amber.shade300,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Surviving Lakas',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'By Adam',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade800,
                          ),
                        ),
                      ],
                    ),
                    IconButton.filled(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlayPage(),
                        ),
                      ),
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.amber,
                      ),
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const PodcastAvatar(
            podcastAvatarPath: 'assets/pic.png',
            radius: 100,
          ),
        ],
      ),
    );
  }
}

class PodcastAvatar extends StatelessWidget {
  const PodcastAvatar({
    super.key,
    required this.podcastAvatarPath,
    required this.radius,
  });

  final String podcastAvatarPath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(0.0, 0.0),
      children: [
        CircleAvatar(
          minRadius: radius,
          maxRadius: radius,
          foregroundImage: const AssetImage('assets/disc.jpg'),
        ),
        CircleAvatar(
          minRadius: radius * 0.40,
          maxRadius: radius * 0.40,
          backgroundImage: AssetImage(podcastAvatarPath),
        ),
      ],
    );
  }
}
