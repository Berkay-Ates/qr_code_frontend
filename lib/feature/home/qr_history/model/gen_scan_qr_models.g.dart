// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_scan_qr_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedScannedQRModels _$GeneratedScannedQRModelsFromJson(
        Map<String, dynamic> json) =>
    GeneratedScannedQRModels(
      userQrData: (json['user_qr_data'] as List<dynamic>?)
          ?.map((e) => UserQrData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeneratedScannedQRModelsToJson(
        GeneratedScannedQRModels instance) =>
    <String, dynamic>{
      'user_qr_data': instance.userQrData,
    };

UserQrData _$UserQrDataFromJson(Map<String, dynamic> json) => UserQrData(
      sId: json['sId'] as String?,
      qrType: json['qrType'] as String?,
      qrData: json['qrData'] as String?,
      owner: json['owner'] as String?,
      qrImage: json['qrImage'] as String?,
      uploadTime: json['uploadTime'] as String?,
    );

Map<String, dynamic> _$UserQrDataToJson(UserQrData instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'qrType': instance.qrType,
      'qrData': instance.qrData,
      'owner': instance.owner,
      'qrImage': instance.qrImage,
      'uploadTime': instance.uploadTime,
    };
