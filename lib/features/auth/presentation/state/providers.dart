import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:patient/core/network/base_client.dart';
import 'package:patient/core/network/network_checker.dart';

import '../../data/datasources/auth_local_datasource.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSourceImpl>(
  (ref) => AuthLocalDataSourceImpl(hive: ref.watch(hiveProvider)),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(authRepositoryProvider),
  ),
);
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSourceImpl>(
  (ref) => AuthRemoteDataSourceImpl(
    baseClient: ref.watch(baseClientProvider),
    auth: ref.watch(firebaseProvider),
  ),
);

final authRepositoryProvider = Provider<AuthRepositoryImpl>(
  (ref) => AuthRepositoryImpl(
    authLocalDataSource: ref.watch(authLocalDataSourceProvider),
    authRemoteDataSource: ref.watch(authRemoteDataSourceProvider),
  ),
);

final formProvider = StateProvider((ref) => GlobalKey<FormState>());
final hiveProvider = Provider<HiveInterface>((ref) => Hive);

final httpProvider = Provider<http.Client>((ref) => http.Client());
final networkCheckerProvider = Provider<NetworkCheckerImpl>(
  (ref) => NetworkCheckerImpl(
    connectionChecker: InternetConnectionChecker(),
  ),
);
final baseClientProvider = Provider<CustomBaseClientImpl>(
  (ref) => CustomBaseClientImpl(
    httpClient: ref.watch(httpProvider),
    networkChecker: ref.watch(networkCheckerProvider),
  ),
);

final firebaseProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
