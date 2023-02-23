import 'package:json_annotation/json_annotation.dart';

part 'gen_scan_qr_models.g.dart';

@JsonSerializable()
class GeneratedScannedQRModels {
  @JsonKey(name: "user_qr_data")
  List<UserQrData>? userQrData;

  GeneratedScannedQRModels({this.userQrData});

  factory GeneratedScannedQRModels.fromJson(Map<String, dynamic> json) {
    return _$GeneratedScannedQRModelsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeneratedScannedQRModelsToJson(this);
  }
}

@JsonSerializable()
class UserQrData {
  @JsonKey(name: "_id")
  String? id;
  String? qrType;
  String? owner;
  String? displayQrData;
  String? qrData;
  String? qrScanGen;
  String? uploadTime;

  UserQrData({this.id, this.qrType, this.owner, this.displayQrData, this.uploadTime, this.qrScanGen, this.qrData});

  factory UserQrData.fromJson(Map<String, dynamic> json) {
    return _$UserQrDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserQrDataToJson(this);
  }
}
