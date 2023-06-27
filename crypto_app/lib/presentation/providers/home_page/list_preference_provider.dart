import 'package:crypto_app/data/repositories/preference_repository_imp.dart';
import 'package:crypto_app/domain/entities/preference_entity.dart';
import 'package:crypto_app/domain/usecases/get_all_preference_usecase.dart';
import 'package:crypto_app/domain/usecases/remove_preference_usecase.dart';
import 'package:crypto_app/domain/usecases/save_preference_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllPreferenceUseCaseProvider = Provider((ref) =>
    GetAllPreferenceUseCase(preferenceRepository: PreferenceRepositoryImp()));

final preferenceNotifierProvider =
    StateNotifierProvider<PreferenceNotifier, List<PreferenceEntity>>(
        (ref) => PreferenceNotifier(ref));

class PreferenceNotifier extends StateNotifier<List<PreferenceEntity>> {
  final StateNotifierProviderRef<PreferenceNotifier, List<PreferenceEntity>>
      ref;
  late final GetAllPreferenceUseCase _service;
  final RemovePreferenceUseCase _removePreferenceUseCase;
  final SavePreferenceUseCase _savePreferenceUseCase;

  PreferenceNotifier(this.ref)
      : _removePreferenceUseCase =
            RemovePreferenceUseCase(repository: PreferenceRepositoryImp()),
        _savePreferenceUseCase = SavePreferenceUseCase(
            preferenceRepository: PreferenceRepositoryImp()),
        super([]) {
    getPreferences();
  }

  Future<void> getPreferences() async {
    _service = ref.watch(getAllPreferenceUseCaseProvider);
    state = await _service();
  }

  bool hasPreference(String symbol) {
    for (var pref in state) {
      if (pref.symbol == symbol) {
        return true;
      }
    }
    return false;
  }

  void removePreference(PreferenceEntity preferenceEntity) {
    state.removeWhere((pref) => pref.symbol == preferenceEntity.symbol);
    _removePreferenceUseCase(preferenceEntity);
  }

  void savePreference(PreferenceEntity preferenceEntity) {
    state.add(preferenceEntity);
    _savePreferenceUseCase(preferenceEntity);
  }
}
