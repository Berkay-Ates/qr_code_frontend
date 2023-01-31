// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_login_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterLoginModel _$RegisterLoginModelFromJson(Map<String, dynamic> json) =>
    RegisterLoginModel(
      json['name'] as String?,
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$RegisterLoginModelToJson(RegisterLoginModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
