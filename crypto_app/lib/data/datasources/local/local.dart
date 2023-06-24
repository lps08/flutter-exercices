abstract class LocalDataSource<T> {
  Future<T> get(String symbol);
  Future<List<T>> getAll();
  Future<void> save(T t);
}
