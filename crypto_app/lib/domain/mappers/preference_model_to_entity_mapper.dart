import 'package:crypto_app/data/models/preference_model.dart';
import 'package:crypto_app/domain/entities/preference_entity.dart';
import 'package:crypto_app/domain/mappers/mapper.dart';

class PreferenceModelToEntityMapper
    implements Mapper<PreferenceModel, PreferenceEntity> {
  @override
  PreferenceModel fromEntity(PreferenceEntity entity) {
    return PreferenceModel(
      symbol: entity.symbol,
    );
  }

  @override
  PreferenceEntity fromModel(PreferenceModel model) {
    return PreferenceEntity(
      symbol: model.symbol!,
    );
  }
}
