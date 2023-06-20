import 'package:flutter/material.dart';
import '../models/podcast.dart';
import 'podcast_avatar.dart';
import '../pages/play_page.dart';

class PodcastListItem extends StatelessWidget {
  const PodcastListItem({
    super.key,
    required this.podcast,
  });

  final Podcast podcast;
  final double podcastAvatarRadiusValue = 45.0;
  final double sizedBoxWidth = 10.0;
  final TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );
  final double titleFontSize = 20.0;
  final double authorFontSize = 15.0;
  final EdgeInsets buttonPadding = const EdgeInsets.all(12.0);
  final double buttonIconFontSize = 25.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: PodcastAvatar(
            podcastAvatarPath: podcast.getAvatarPath,
            radius: podcastAvatarRadiusValue,
          ),
        ),
        SizedBox(
          width: sizedBoxWidth,
        ),
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                podcast.getTitle,
                style: textStyle.copyWith(
                  fontSize: titleFontSize,
                ),
              ),
              Text(
                'By ${podcast.getAuthor}',
                style: textStyle.copyWith(
                  fontSize: authorFontSize,
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
                builder: (context) => PlayPage(podcast: podcast),
              ),
            ),
            style: ButtonStyle(
                padding: MaterialStatePropertyAll(buttonPadding),
                shape: const MaterialStatePropertyAll(CircleBorder()),
                side: MaterialStatePropertyAll(
                    BorderSide(color: Colors.grey.shade300))),
            child: Icon(
              Icons.play_arrow,
              color: Colors.orange,
              size: buttonIconFontSize,
            ),
          ),
        ),
      ],
    );
  }
}
