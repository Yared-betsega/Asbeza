import 'package:asbeza/asbeza.dart';

class SignUpPayload extends Equatable {
  final String email;
  final String password;

  const SignUpPayload({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
