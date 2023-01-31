import '../../constants/app/application_constants.dart';

extension EmailValidator on String {
  String? get checkEmail => contains(RegExp(ApplicationConstants.EmailRegex)) ? null : "Email does not valid";

  bool? get isValidMail => RegExp(ApplicationConstants.EmailRegex).hasMatch(this);
}
