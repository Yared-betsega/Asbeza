import '../../domain/entities/signup_payload.dart';

class SignUpPayloadModel extends SignUpPayload {
  const SignUpPayloadModel({
    required super.name,
    required super.email,
    required super.password,
  });

  factory SignUpPayloadModel.fromJson(Map<String, dynamic> json) {
    return SignUpPayloadModel(
      name: json["name"],
      email: json['name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
