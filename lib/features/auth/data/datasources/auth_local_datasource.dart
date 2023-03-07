import 'package:hive_flutter/hive_flutter.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<void> cacheUserId(String userId);
  Future<void> clear();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final HiveInterface hive;
  AuthLocalDataSourceImpl({required this.hive});

  @override
  Future<void> cacheToken(String token) async {
    var box = _openBox();
    return box.put('token', token);
  }

  @override
  Future<void> cacheUserId(String userId) async {
    var box = _openBox();
    return box.put('userID', userId);
  }

  @override
  Future<void> clear() async {
    Box box = _openBox();
    box.deleteAll(['userID', 'token']);
  }

  Box _openBox() {
    final box = Hive.box('saveme');
    return box;
  }
}
