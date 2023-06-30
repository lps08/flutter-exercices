import 'package:crypto_app/data/models/preference_model.dart';
import 'package:crypto_app/domain/entities/preference_entity.dart';
import 'package:crypto_app/domain/mappers/mapper.dart';
import 'package:crypto_app/domain/mappers/preference_model_to_entity_mapper.dart';
import 'package:crypto_app/domain/repository/preference_repository.dart';

class RemovePreferenceUseCase {
  PreferenceRepository<PreferenceModel> repository;
  final Mapper<PreferenceModel, PreferenceEntity> _mapper;

  RemovePreferenceUseCase({required this.repository})
      : _mapper = PreferenceModelToEntityMapper();

  Future<void> call(PreferenceEntity preferenceEntity) async {
    return await repository.remove(_mapper.fromEntity(preferenceEntity));
  }
}
