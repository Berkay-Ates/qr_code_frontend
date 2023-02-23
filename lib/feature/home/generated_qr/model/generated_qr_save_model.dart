// ignore_for_file: public_member_api_docs, sort_constructors_first
// {
//     "qrType":"email",
//     "displayQrData":"this is for display qr data",
//     "qrData":"this is for qr generate data",
//     "qrScanGen":"generated"
// }

import 'package:json_annotation/json_annotation.dart';

part 'generated_qr_save_model.g.dart';

@JsonSerializable()
class GeneratedQrModel {
  String? qrType;
  String? displayQrData;
  String? qrData;
  String? qrScanGen;

  GeneratedQrModel({this.qrType, this.displayQrData, this.qrData, this.qrScanGen});

  factory GeneratedQrModel.fromJson(Map<String, dynamic> json) {
    return _$GeneratedQrModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeneratedQrModelToJson(this);
  }
}
