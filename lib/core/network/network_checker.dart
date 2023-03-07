import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker {
  Future<bool> get hasConnection;
}

class NetworkCheckerImpl implements NetworkChecker {
  final InternetConnectionChecker connectionChecker;
  NetworkCheckerImpl({required this.connectionChecker});

  @override
  Future<bool> get hasConnection => connectionChecker.hasConnection;
}
