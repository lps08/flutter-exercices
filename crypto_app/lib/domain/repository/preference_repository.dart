import 'package:crypto_app/data/datasources/local/local.dart';

class PreferenceRepository<T> {
  LocalDataSource<T> localDataSource;

  PreferenceRepository({required this.localDataSource});

  Future<T> get(String symbol) async {
    return await localDataSource.get(symbol);
  }

  Future<List<T>> getAll() async {
    return await localDataSource.getAll();
  }

  Future<void> save(T t) async {
    await localDataSource.save(t);
  }
}
