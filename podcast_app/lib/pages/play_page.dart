import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/podcast.dart';
import '../widgets/podcast_avatar.dart';
import '../widgets/play_info.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key, required this.podcast});

  final Podcast podcast;

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Podcast podcast;
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

    podcast = widget.podcast;
    podcast.initPlayer();

    podcast.getAudioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.ready) {
        if (state.playing) {
          setState(() {
            _playing = true;
          });
        } else {
          setState(() {
            _playing = false;
          });
        }
      }

      if (state.processingState == ProcessingState.completed) {
        podcast.getAudioPlayer.pause();
        _controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    podcast.getAudioPlayer.dispose();
    super.dispose();
  }

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
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Transform.rotate(
                  angle: _animation.value,
                  child: PodcastAvatar(
                    podcastAvatarPath: podcast.getAvatarPath,
                    radius: 180,
                  ),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              PlayInfo(
                title: podcast.title,
                author: podcast.author,
              ),
              const SizedBox(
                height: 100.0,
              ),
              StreamBuilder(
                stream: podcast.getAudioPlayer.positionStream,
                builder: (context, snapshot) {
                  Duration? playerCurrentDuration = snapshot.data;
                  return ProgressBar(
                    progress: playerCurrentDuration ?? Duration.zero,
                    total: podcast.getAudioPlayer.duration ?? Duration.zero,
                    barCapShape: BarCapShape.round,
                    progressBarColor: podcast.getColor,
                    baseBarColor: podcast.getColor.shade50,
                    thumbColor: Colors.grey,
                    onDragUpdate: (details) {
                      podcast.getAudioPlayer.seek(details.timeStamp);
                    },
                    onSeek: (value) => podcast.getAudioPlayer.seek(value),
                  );
                },
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
        onTap: (value) {
          debugPrint(value.toString());
          if (value == 1) {
            podcast.getAudioPlayer.seek(Duration(
                seconds:
                    podcast.getAudioPlayer.position.inSeconds.toInt() - 20));
          } else if (value == 3) {
            podcast.getAudioPlayer.seek(Duration(
                seconds:
                    podcast.getAudioPlayer.position.inSeconds.toInt() + 20));
          }
        },
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
                    podcast.getAudioPlayer.play();
                  } else {
                    _controller.stop();
                    podcast.getAudioPlayer.pause();
                  }
                });
              },
              icon: Icon(
                _playing ? Icons.pause : Icons.play_arrow_rounded,
                color: Colors.white,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(podcast.getColor),
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
