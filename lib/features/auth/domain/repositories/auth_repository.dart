import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patient/core/resources/failures.dart';
import 'package:patient/core/resources/success.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Stream<User?> isLogedIn();
  Future<Either<Failure, Success>> login(UserEntity user);
  Future<Either<Failure, Success>> register(UserEntity user);
  Future<Either<Failure, Success>> logout();
}
