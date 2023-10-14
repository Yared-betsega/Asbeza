import 'package:asbeza/asbeza.dart';

class SignUpPayloadModel extends SignUpPayload {
  const SignUpPayloadModel({
    required super.email,
    required super.password,
  });

  factory SignUpPayloadModel.fromJson(Map<String, dynamic> json) {
    return SignUpPayloadModel(
      email: json['name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
