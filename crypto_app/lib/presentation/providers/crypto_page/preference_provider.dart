import 'package:crypto_app/domain/entities/preference_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final preferenceProvider =
    StateProvider<PreferenceEntity>((ref) => PreferenceEntity(symbol: 'none'));
