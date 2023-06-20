import 'package:flutter/material.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/header.dart';
import '../widgets/navigator_button.dart';
import '../widgets/podcast_card.dart';
import '../models/podcast.dart';
import '../widgets/podcast_list_item.dart';

class PodcastHomePage extends StatefulWidget {
  const PodcastHomePage({super.key});

  @override
  State<PodcastHomePage> createState() => _PodcastHomePageState();
}

class _PodcastHomePageState extends State<PodcastHomePage> {
  List<Widget> getPodcastCards() {
    List<Widget> podcastCardWidgets = [];
    for (var pod in podcastList) {
      podcastCardWidgets.add(PodcastCard(
        podcast: pod,
      ));
    }
    return podcastCardWidgets;
  }

  List<Widget> getPodcastListItems() {
    List<Widget> podcastListItemWidgets = [];
    for (var pod in podcastList) {
      podcastListItemWidgets.add(PodcastListItem(
        podcast: pod,
      ));
    }
    return podcastListItemWidgets;
  }

  int _selectedIndex = 0;

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
              const Header(
                name: 'Luciano',
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigatorButton(title: 'Popular ❤️‍🔥', pressed: true),
                  NavigatorButton(title: 'Featured', pressed: false),
                  NavigatorButton(title: 'Trending', pressed: false),
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
                  items: getPodcastCards(),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: getPodcastListItems(),
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
          currentIndex: _selectedIndex,
          elevation: 0.0,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag),
              label: 'fav',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'seṭtings',
            ),
          ],
        ),
      ),
    );
  }
}
