import 'package:crypto_app/data/models/preference_model.dart';
import 'package:crypto_app/domain/entities/preference_entity.dart';
import 'package:crypto_app/domain/mappers/mapper.dart';
import 'package:crypto_app/domain/mappers/preference_model_to_entity_mapper.dart';
import 'package:crypto_app/domain/repository/preference_repository.dart';

class GetAllPreferenceUseCase {
  PreferenceRepository<PreferenceModel> preferenceRepository;
  final Mapper<PreferenceModel, PreferenceEntity> _mapper;
  GetAllPreferenceUseCase({required this.preferenceRepository})
      : _mapper = PreferenceModelToEntityMapper();

  Future<List<PreferenceEntity>> call() async {
    List<PreferenceEntity> listPreferenceEntity = [];
    List<PreferenceModel> listPreferenceModel =
        await preferenceRepository.getAll();
    listPreferenceModel.forEach((model) {
      listPreferenceEntity.add(_mapper.fromModel(model));
    });
    return listPreferenceEntity;
  }
}
