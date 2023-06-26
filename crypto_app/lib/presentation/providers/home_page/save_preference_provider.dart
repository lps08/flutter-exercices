import 'package:crypto_app/data/repositories/preference_repository_imp.dart';
import 'package:crypto_app/domain/usecases/save_preference_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final savePrederenceUseCaseProvider = Provider((ref) =>
    SavePreferenceUseCase(preferenceRepository: PreferenceRepositoryImp()));
