abstract class FonteRemota<T> {
  Future<T> get();
  Future<List<T>> getLista();
}
