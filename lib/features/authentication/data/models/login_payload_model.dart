import '../../domain/entities/login_payload.dart';

class LoginPayloadModel extends LoginPayload {
  const LoginPayloadModel({
    required super.email,
    required super.password,
  });

  factory LoginPayloadModel.fromJson(Map<String, dynamic> json) {
    return LoginPayloadModel(
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
