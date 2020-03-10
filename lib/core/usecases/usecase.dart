abstract class UseCase<Type, Type1, Params> {
  Type call(Params id);

  Future<int> insert(Type1 entity);

  Future<bool> update(Type1 entity);

  Future<int> delete(Type1 entity);
}

class NoParams {}
