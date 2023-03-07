import 'package:equatable/equatable.dart';

import '../../data/models/login_model.dart';

class LoginEntity extends Equatable {
  final String? email;
  final String? password;

  const LoginEntity({
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [email, password];

  toLoginModel() {
    return LoginModel(
      email: email ?? "",
      password: password ?? "",
    );
  }
}
