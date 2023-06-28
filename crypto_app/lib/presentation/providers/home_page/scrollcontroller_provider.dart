import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollControleProvider =
    Provider.autoDispose((ref) => ScrollController());
