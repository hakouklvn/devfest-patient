import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:patient/core/network/base_client.dart';

import '../models/models.dart';

abstract class AuthRemoteDataSource {
  Future<User?> login(UserModel user);
  Future<User?> register(UserModel user);
  Stream<User?> isLogedIn();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final CustomBaseClient baseClient;
  final FirebaseAuth auth;
  AuthRemoteDataSourceImpl({required this.baseClient, required this.auth});

  @override
  Future<User?> login(UserModel userModel) async {
    UserCredential cred = await auth.signInWithEmailAndPassword(
      email: userModel.email ?? "",
      password: userModel.password ?? "",
    );
    return cred.user;
  }

  @override
  Future<User?> register(UserModel userModel) async {
    UserCredential cred = await auth.createUserWithEmailAndPassword(
      email: userModel.email ?? "",
      password: userModel.password ?? "",
    );
    return cred.user;
  }

  @override
  Stream<User?> isLogedIn() {
    return auth.authStateChanges();
  }
}
