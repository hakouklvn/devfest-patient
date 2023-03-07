import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient/core/resources/error_object.dart';
import '../../domain/repositories/auth_repository.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/entities/user_entity.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  AuthNotifier(this._authRepository) : super(AuthState.initial());

  Future<void> isLoggedIn() async {
    Stream user = _authRepository.isLogedIn();
    user.listen((authResult) {
      if (authResult == null) {
        state = AuthState.unauthenticated();
      } else {
        state = AuthState.authenticated();
      }
    });
  }

  Future<void> login(UserEntity userEntity) async {
    state = AuthState.authenticating();
    final loginResult = await _authRepository.login(userEntity);

    state = loginResult.fold(
      (failure) {
        return AuthState.failure(
          ErrorObject.mapFailureToErrorObject(failure: failure),
        );
      },
      (success) => AuthState.authenticated(),
    );

    await Future.delayed(const Duration(seconds: 5));
    state = AuthState.initial();
  }

  Future<void> logout() async {
    final logoutResult = await _authRepository.logout();

    state = logoutResult.fold(
      (failure) => AuthState.failure(
        ErrorObject.mapFailureToErrorObject(failure: failure),
      ),
      (success) => AuthState.signedOut(),
    );

    state = AuthState.initial();
  }

  Future<void> register(UserEntity userEntity) async {
    state = AuthState.authenticating();
    final registerResult = await _authRepository.register(userEntity);

    state = registerResult.fold(
      (failure) => AuthState.failure(
        ErrorObject.mapFailureToErrorObject(failure: failure),
      ),
      (success) => AuthState.authenticated(),
    );

    await Future.delayed(const Duration(seconds: 5));
    state = AuthState.initial();
  }
}
