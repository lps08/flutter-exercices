abstract class Mapper<M, E> {
  M fromEntity(E entity);
  E fromModel(M model);
}
