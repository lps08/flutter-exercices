import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:just_audio/just_audio.dart';

class Podcast {
  final String title;
  final String author;
  final String avatarPath;
  final String podcastAudioPath;
  final List<MaterialColor> _colors = [
    Colors.amber,
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.lime,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.yellow,
  ];
  final math.Random _random = math.Random();
  late MaterialColor _selectedColor;
  late AudioPlayer _audioPlayer;

  Podcast({
    required this.title,
    required this.author,
    required this.avatarPath,
    required this.podcastAudioPath,
  }) {
    _selectedColor = _colors[_random.nextInt(_colors.length)];
  }

  Future<void> initPlayer() async {
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setAsset(podcastAudioPath);
  }

  String get getTitle => title;
  String get getAuthor => author;
  String get getAvatarPath => avatarPath;
  MaterialColor get getColor => _selectedColor;
  AudioPlayer get getAudioPlayer => _audioPlayer;
}

List<Podcast> podcastList = [
  Podcast(
    title: 'JRE #1532|Mike Tyson',
    author: 'Joe Rogan',
    avatarPath: 'assets/mike.png',
    podcastAudioPath: 'assets/Mike-Tyson .mp3',
  ),
  Podcast(
    title: 'JRE #1347|Neil',
    author: 'Joe Rogan',
    avatarPath: 'assets/niel.png',
    podcastAudioPath: 'assets/Neil-deGrasse.mp3',
  ),
  Podcast(
    title: 'JRE #1552|M. McConaughey',
    author: 'Joe Rogan',
    avatarPath: 'assets/matthew.png',
    podcastAudioPath: 'assets/Matthew-McConaughey.mp3',
  ),
  Podcast(
    title: 'SPACE TODAY - Flow #231',
    author: 'Igor3K',
    avatarPath: 'assets/space.png',
    podcastAudioPath: 'assets/space-today.mp3',
  ),
  Podcast(
    title: 'POPÓ - Flow #544',
    author: 'Igor3K',
    avatarPath: 'assets/popo.png',
    podcastAudioPath: 'assets/popo.mp3',
  ),
  Podcast(
    title: 'What\'s life',
    author: 'Luciano',
    avatarPath: 'assets/pic.png',
    podcastAudioPath: 'assets/piano.mp3',
  )
];
