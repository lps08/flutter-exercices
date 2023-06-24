import 'package:crypto_app/data/models/preference_model.dart';
import 'package:crypto_app/data/repositories/preference_repository_imp.dart';
import 'package:crypto_app/domain/entities/preference_entity.dart';
import 'package:crypto_app/domain/mappers/mapper.dart';
import 'package:crypto_app/domain/mappers/preference_model_to_entity_mapper.dart';
import 'package:crypto_app/domain/repository/preference_repository.dart';

class SavePreferenceUseCase {
  PreferenceRepository<PreferenceModel> preferenceRepository;
  final Mapper<PreferenceModel, PreferenceEntity> _mapper;

  SavePreferenceUseCase({required this.preferenceRepository})
      : _mapper = PreferenceModelToEntityMapper();

  Future<void> call(PreferenceEntity preferenceEntity) async {
    await preferenceRepository.save(_mapper.fromEntity(preferenceEntity));
  }
}

void main(List<String> args) {
  SavePreferenceUseCase savePreferenceUseCase =
      SavePreferenceUseCase(preferenceRepository: PreferenceRepositoryImp());

  PreferenceEntity preferenceEntity = PreferenceEntity(symbol: 'cat');
  savePreferenceUseCase(preferenceEntity);
}
