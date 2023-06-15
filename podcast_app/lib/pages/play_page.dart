import 'package:flutter/material.dart';
import '../models/podcast.dart';
import '../widgets/podcast_avatar.dart';
import '../widgets/play_info.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _playing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 8000),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 12.5664, // 2Radians (360 degrees)
    ).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Podcast podcastArgs =
        ModalRoute.of(context)!.settings.arguments as Podcast;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Transform.rotate(
                  angle: _animation.value,
                  child: PodcastAvatar(
                    podcastAvatarPath: podcastArgs.getAvatarPath,
                    radius: 180,
                  ),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              PlayInfo(
                title: podcastArgs.title,
                author: podcastArgs.author,
              ),
              const SizedBox(
                height: 100.0,
              ),
              ProgressBar(
                progress: const Duration(milliseconds: 0),
                total: const Duration(milliseconds: 5000),
                barCapShape: BarCapShape.round,
                progressBarColor: podcastArgs.getColor,
                baseBarColor: podcastArgs.getColor.shade50,
                thumbColor: Colors.grey,
                onDragEnd: () {
                  _controller.stop();
                },
                onDragStart: (details) => _controller.forward(),
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
              onPressed: () {
                setState(() {
                  if (!_playing) {
                    _controller.forward();
                  } else {
                    _controller.stop();
                  }
                  _playing = !_playing;
                });
              },
              icon: Icon(
                _playing ? Icons.pause : Icons.play_arrow_rounded,
                color: Colors.white,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(podcastArgs.getColor),
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
