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
      id: json['_id'] as String?,
      qrType: json['qrType'] as String?,
      owner: json['owner'] as String?,
      displayQrData: json['displayQrData'] as String?,
      uploadTime: json['uploadTime'] as String?,
      qrScanGen: json['qrScanGen'] as String?,
      qrData: json['qrData'] as String?,
    );

Map<String, dynamic> _$UserQrDataToJson(UserQrData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'qrType': instance.qrType,
      'owner': instance.owner,
      'displayQrData': instance.displayQrData,
      'qrData': instance.qrData,
      'qrScanGen': instance.qrScanGen,
      'uploadTime': instance.uploadTime,
    };
