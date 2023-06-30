import 'package:crypto_app/data/datasources/local/preference_local.dart';
import 'package:crypto_app/data/models/preference_model.dart';
import 'package:crypto_app/domain/repository/preference_repository.dart';

class PreferenceRepositoryImp extends PreferenceRepository<PreferenceModel> {
  PreferenceRepositoryImp() : super(localDataSource: PreferenceDataSource());
}
