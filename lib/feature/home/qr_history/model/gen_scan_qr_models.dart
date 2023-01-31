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
  String? sId;
  String? qrType;
  String? qrData;
  String? owner;
  String? qrImage;
  String? uploadTime;

  UserQrData({this.sId, this.qrType, this.qrData, this.owner, this.qrImage, this.uploadTime});

  factory UserQrData.fromJson(Map<String, dynamic> json) {
    return _$UserQrDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserQrDataToJson(this);
  }
}
