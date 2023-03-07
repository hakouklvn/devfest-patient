import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  factory Failure.serverFailure() = _ServerFailure;
  factory Failure.authFailure() = _AuthFailure;
  factory Failure.notValidFailure() = _NotValidFailure;
  factory Failure.cacheFailure() = _CacheFailure;
  factory Failure.networkFailure() = _NetworkFailure;
}
