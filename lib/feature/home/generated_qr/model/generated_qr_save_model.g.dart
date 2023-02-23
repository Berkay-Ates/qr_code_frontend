// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_qr_save_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedQrModel _$GeneratedQrModelFromJson(Map<String, dynamic> json) =>
    GeneratedQrModel(
      qrType: json['qrType'] as String?,
      displayQrData: json['displayQrData'] as String?,
      qrData: json['qrData'] as String?,
      qrScanGen: json['qrScanGen'] as String?,
    );

Map<String, dynamic> _$GeneratedQrModelToJson(GeneratedQrModel instance) =>
    <String, dynamic>{
      'qrType': instance.qrType,
      'displayQrData': instance.displayQrData,
      'qrData': instance.qrData,
      'qrScanGen': instance.qrScanGen,
    };
