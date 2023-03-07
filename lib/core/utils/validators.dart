import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]");

String? emptyTextFieldValidator(value) {
  if (value.isEmpty) {
    return getemptyTextField();
  }
  return null;
}

String? emailValidator(value) {
  if (value.isEmpty) {
    return getEmail();
  }
  if (!emailValidatorRegExp.hasMatch(value)) {
    return getValidEmail();
  }
  return null;
}

String? passwordValidator(value) {
  if (value.isEmpty) {
    return getPassword();
  }
  if (value.length < 6) {
    return getValidPassword();
  }
  return null;
}

class Validators {
  static String? email;
  static String? validEmail;
  static String? password;
  static String? validPassword;
  static String? emptyTextField;
  void init(BuildContext context) {
    email = AppLocalizations.of(context)!.enterEmail;
    validEmail = AppLocalizations.of(context)!.enterValidEmail;
    password = AppLocalizations.of(context)!.enterPassword;
    validPassword = AppLocalizations.of(context)!.enterValidPassword;
    emptyTextField = AppLocalizations.of(context)!.emptyTextField;
  }
}

String? getEmail() => Validators.email;
String? getValidEmail() => Validators.validEmail;
String? getPassword() => Validators.password;
String? getValidPassword() => Validators.validPassword;
String? getemptyTextField() => Validators.emptyTextField;

// @freezed
// class Validators with _$Validators {
//   factory Validators.empty() = _Empty;
//   factory Validators.invalidEmail(String failedValue) = _InvalidEmail;
//   factory Validators.shortPassword(String failedValue) = _ShortPassword;
// }

// class Password extends Equatable {
//   factory Password(String input) => Password._(_validatePassword(input));

//   const Password._(this.value);

//   final Either<Validators, String> value;

//   @override
//   List<Object?> get props => [value];
// }

// Either<Validators, String> _validatePassword(String input) {
//   if (input.length >= 5) {
//     return right(input);
//   } else {
//     return left(
//       Validators.shortPassword(input),
//     );
//   }
// }
