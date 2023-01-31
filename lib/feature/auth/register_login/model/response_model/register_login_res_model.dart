import 'package:json_annotation/json_annotation.dart';

part 'register_login_res_model.g.dart';

@JsonSerializable()
class RegisterLoginResponseModel {
  String? name;
  String? token;

  RegisterLoginResponseModel({this.name, this.token});

  factory RegisterLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterLoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterLoginResponseModelToJson(this);
  }
}
