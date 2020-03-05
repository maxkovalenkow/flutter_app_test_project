abstract class NetworkInfo {
  bool isConnected;
}

class NetworkInfoImpl extends NetworkInfo {
  final bool connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  get isConnected => connectionChecker;
}