import 'package:equatable/equatable.dart';

import 'failures.dart';

class ErrorObject extends Equatable {
  const ErrorObject({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object?> get props => [title, message];

  static ErrorObject mapFailureToErrorObject({required Failure failure}) {
    return failure.when(
      serverFailure: () => const ErrorObject(
        title: 'Error Code: INTERNAL_SERVER_FAILURE',
        message: 'Something went wrong',
      ),
      authFailure: () => const ErrorObject(
        title: 'Error Code: AUTHENTICATION_FAILURE',
        message: 'please check your email or password',
      ),
      notValidFailure: () => const ErrorObject(
        title: 'Error Code: NOT_VALID_FAILURE',
        message: 'This email is already in use',
      ),
      cacheFailure: () => const ErrorObject(
        title: 'Error Code: INTERNAL_CACHE_FAILURE',
        message: 'an error with internal storage',
      ),
      networkFailure: () => const ErrorObject(
        title: 'Error Code: NETWORK_FAILURE',
        message: 'No internet, Please try again later',
      ),
    );
  }
}
