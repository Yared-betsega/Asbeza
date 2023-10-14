import 'package:asbeza/asbeza.dart';

class LoginPayload extends Equatable {
  final String email;
  final String password;

  const LoginPayload({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
