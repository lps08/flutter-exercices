abstract class RemoteDatasource<T> {
  Future<T> get(String symbol);
  Future<List<T>> getAll(int limit);
}
