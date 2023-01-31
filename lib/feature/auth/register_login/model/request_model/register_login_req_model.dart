import 'package:json_annotation/json_annotation.dart';

part 'register_login_req_model.g.dart';

@JsonSerializable()
class RegisterLoginModel {
  final String? name;
  final String email;
  final String password;

  RegisterLoginModel(this.name, this.email, this.password);

  factory RegisterLoginModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterLoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterLoginModelToJson(this);
  }
}
