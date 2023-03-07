import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patient/core/resources/exceptions.dart';
import 'package:patient/core/resources/success.dart';

import '../../../../core/resources/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, Success>> login(UserEntity user) async {
    try {
      final User? userResponse =
          await authRemoteDataSource.login(user.toUserModel());

      await authLocalDataSource.cacheUserId(userResponse!.uid);

      return Right(GoodResponse('good'));
    } on AuthException {
      return Left(Failure.authFailure());
    } on ServerException {
      return Left(Failure.serverFailure());
    } on CacheException {
      return Left(Failure.cacheFailure());
    } on NetworkException {
      return Left(Failure.networkFailure());
    } on FirebaseAuthException {
      return Left(Failure.authFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> logout() async {
    try {
      await authLocalDataSource.clear();

      return Right(GoodResponse('good'));
    } on ServerException {
      return Left(Failure.serverFailure());
    } on CacheException {
      return Left(Failure.cacheFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> register(UserEntity user) async {
    try {
      final User? userResponse =
          await authRemoteDataSource.register(user.toUserModel());

      await authLocalDataSource.cacheUserId(userResponse!.uid);

      return Right(GoodResponse('good'));
    } on NotValidException {
      return Left(Failure.notValidFailure());
    } on AuthException {
      return Left(Failure.authFailure());
    } on ServerException {
      return Left(Failure.serverFailure());
    } on CacheException {
      return Left(Failure.cacheFailure());
    } on NetworkException {
      return Left(Failure.networkFailure());
    } on FirebaseAuthException {
      return Left(Failure.authFailure());
    }
  }

  @override
  Stream<User?> isLogedIn() async* {
    final Stream<User?> stream = authRemoteDataSource.isLogedIn();
    yield* stream;
  }
}
