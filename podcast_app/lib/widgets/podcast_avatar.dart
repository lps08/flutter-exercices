import 'package:flutter/material.dart';

class PodcastAvatar extends StatelessWidget {
  const PodcastAvatar({
    super.key,
    required this.podcastAvatarPath,
    required this.radius,
  });

  final String podcastAvatarPath;
  final double radius;
  final AlignmentDirectional alignment = const AlignmentDirectional(0.0, 0.0);
  final String discBackgroundPath = 'assets/disc.jpg';
  final double avatarRatio = 0.40;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        CircleAvatar(
          minRadius: radius,
          maxRadius: radius,
          foregroundImage: AssetImage(discBackgroundPath),
        ),
        CircleAvatar(
          minRadius: radius * avatarRatio,
          maxRadius: radius * avatarRatio,
          backgroundImage: AssetImage(podcastAvatarPath),
        ),
      ],
    );
  }
}
