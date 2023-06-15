import 'package:flutter/material.dart';
import 'dart:math' as math;

class Podcast {
  final String title;
  final String author;
  final String avatarPath;
  final int? duration;
  final int? currentDuration;
  final List<MaterialColor> colors = [
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
  late MaterialColor selectedColor;

  Podcast({
    required this.title,
    required this.author,
    required this.avatarPath,
    this.duration,
    this.currentDuration,
  }) {
    selectedColor = colors[_random.nextInt(colors.length)];
  }

  String get getTitle => title;
  String get getAuthor => author;
  String get getAvatarPath => avatarPath;
  int? get getDuration => duration;
  int? get getCurrentDuration => currentDuration;
  MaterialColor get getColor => selectedColor;
}

List<Podcast> podcastList = [
  Podcast(
    title: 'JRE #1532|Mike Tyson',
    author: 'Joe Rogan',
    avatarPath: 'assets/mike.png',
    duration: 10,
  ),
  Podcast(
    title: 'JRE #1347|Neil',
    author: 'Joe Rogan',
    avatarPath: 'assets/niel.png',
    duration: 8,
  ),
  Podcast(
    title: 'JRE #1552|M. McConaughey',
    author: 'Joe Rogan',
    avatarPath: 'assets/matthew.png',
    duration: 12,
  ),
  Podcast(
    title: 'SPACE TODAY - Flow #231',
    author: 'Igor3K',
    avatarPath: 'assets/space.png',
    duration: 20,
  ),
  Podcast(
    title: 'POPÓ - Flow #544',
    author: 'Igor3K',
    avatarPath: 'assets/popo.png',
    duration: 22,
  ),
  Podcast(
    title: 'What\'s life',
    author: 'Luciano',
    avatarPath: 'assets/pic.png',
    duration: 30,
  )
];
