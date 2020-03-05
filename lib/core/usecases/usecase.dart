abstract class UseCase<Type, Params> {
  Type call({Params params});
}

class NoParams {
  
}

class Params<Type> {
  final Type value;

  Params(this.value);
}
