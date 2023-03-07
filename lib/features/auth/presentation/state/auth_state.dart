import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/resources/error_object.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState.initial() = _Initial;
  factory AuthState.authenticating() = _Authenticating;
  factory AuthState.unauthenticated() = _Unauthenticated;
  factory AuthState.authenticated() = _Authenticated;
  factory AuthState.savedUser() = _SavedUser;
  factory AuthState.signedOut() = _SignedOut;
  factory AuthState.failure(ErrorObject failure) = _Failure;
}
