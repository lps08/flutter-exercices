import 'package:flutter/material.dart';
import '../models/podcast.dart';
import 'podcast_avatar.dart';
import '../pages/play_page.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({
    super.key,
    required this.podcast,
  });

  final Podcast podcast;
  final EdgeInsets outsideWidgetPadding =
      const EdgeInsets.only(top: 85, right: 20.0);
  final AlignmentDirectional alignmentStack =
      const AlignmentDirectional(0.0, -7.5);
  final EdgeInsets cardPadding = const EdgeInsets.only(
    top: 115.0,
    left: 20.0,
    right: 20.0,
    bottom: 20.0,
  );
  final EdgeInsets containerPadding =
      const EdgeInsets.symmetric(horizontal: 10.0);
  final double containerWidth = 300.0;
  final double containerRadiusValue = 10.0;
  final double podcastAvatarRadiusValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outsideWidgetPadding,
      child: Stack(
        alignment: alignmentStack,
        children: [
          Card(
            color: podcast.getColor,
            child: Padding(
              padding: cardPadding,
              child: Container(
                padding: containerPadding,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: podcast.getColor.shade300,
                  borderRadius: BorderRadius.all(
                    Radius.circular(containerRadiusValue),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          podcast.getTitle,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'By ${podcast.getAuthor}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: podcast.getColor.shade800,
                          ),
                        ),
                      ],
                    ),
                    IconButton.filled(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlayPage(),
                          settings: RouteSettings(arguments: podcast),
                        ),
                      ),
                      icon: Icon(
                        Icons.play_arrow,
                        color: podcast.getColor,
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
          PodcastAvatar(
            podcastAvatarPath: podcast.getAvatarPath,
            radius: podcastAvatarRadiusValue,
          ),
        ],
      ),
    );
  }
}
