import 'package:crypto_app/data/models/preference_model.dart';
import 'package:crypto_app/domain/entities/preference_entity.dart';
import 'package:crypto_app/domain/mappers/mapper.dart';
import 'package:crypto_app/domain/mappers/preference_model_to_entity_mapper.dart';
import 'package:crypto_app/domain/repository/preference_repository.dart';

class GetPreferenceUseCase {
  PreferenceRepository<PreferenceModel> preferenceRepository;
  final Mapper<PreferenceModel, PreferenceEntity> _mapper;

  GetPreferenceUseCase({required this.preferenceRepository})
      : _mapper = PreferenceModelToEntityMapper();

  Future<PreferenceEntity> call(String symbol) async {
    PreferenceModel preferenceModel = await preferenceRepository.get(symbol);
    return _mapper.fromModel(preferenceModel);
  }
}
