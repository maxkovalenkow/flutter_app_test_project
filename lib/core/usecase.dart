abstract class UseCase<Type, Params> {
  Type call(Params id);
}

class NoParams {}
