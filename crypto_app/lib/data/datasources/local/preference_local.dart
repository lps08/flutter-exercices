import 'package:crypto_app/data/datasources/local/local.dart';
import 'package:crypto_app/data/models/preference_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class PreferenceDataSource implements LocalDataSource<PreferenceModel> {
  late Isar _isar;

  PreferenceDataSource() {
    _init();
  }

  Future<void> _init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [PreferenceModelSchema],
      directory: dir.path,
    );
  }

  @override
  Future<PreferenceModel> get(String symbol) async {
    PreferenceModel? preferenceModel =
        await _isar.preferenceModels.filter().symbolEqualTo(symbol).findFirst();

    if (preferenceModel != null) {
      return preferenceModel;
    }
    return PreferenceModel(symbol: 'none');
  }

  @override
  Future<List<PreferenceModel>> getAll() async {
    await _init();
    return await _isar.preferenceModels.where().findAll();
  }

  @override
  Future<void> remove(PreferenceModel preferenceModel) async {
    await _isar.writeTxn(() async {
      await _isar.preferenceModels
          .filter()
          .symbolEqualTo(preferenceModel.symbol)
          .deleteAll();
    });
  }

  @override
  Future<void> save(PreferenceModel preferenceModel) async {
    await _isar.writeTxn(() async {
      await _isar.preferenceModels.put(preferenceModel);
    });
  }
}
