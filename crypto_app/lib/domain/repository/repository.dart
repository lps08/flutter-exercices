import '../../data/datasources/remote/remote.dart';

abstract class Repository<T> {
  RemoteDatasource<T> remoteDatasource;

  Repository({required this.remoteDatasource});

  Future<T> get(String symbol) async {
    return await remoteDatasource.get(symbol);
  }

  Future<List<T>> getAll(int limit) async {
    return await remoteDatasource.getAll(limit);
  }
}
