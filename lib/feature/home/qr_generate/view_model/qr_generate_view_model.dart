import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/enums/qr_code_options_enums.dart';
import '../../../../product/enums/social_media_enums.dart';
import '../../generated_qr/view/generated_qr_view.dart';
import '../model/ar_generate_model.dart';

part 'qr_generate_view_model.g.dart';

class QrGenerateViewModel = _QrGenerateViewModelBase with _$QrGenerateViewModel;

abstract class _QrGenerateViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  TextEditingController? textEditingController1;
  TextEditingController? textEditingController2;
  TextEditingController? textEditingController3;
  TextEditingController? textEditingController4;
  TextEditingController? textEditingController5;

  // * forma key atıyoruz form icerisindeki textFieldlara validator yazıyoruz formun keyi uzerinden validatae
  //* ettigimizde form icerisindeki elemanların controllerları calısmıs oluyor.

  @observable
  bool isloading = false;

  @observable
  SocialMediaEnums socialMediaEnums = SocialMediaEnums.Facebook;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @observable
  int selectedIndex = 0;

  @observable
  QrCodeOptionsEnum qrCodeOptionsEnum = QrCodeOptionsEnum.text;

  @override
  void init() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    textEditingController3 = TextEditingController();
    textEditingController4 = TextEditingController();
    textEditingController5 = TextEditingController();
  }

  @observable
  QrGenerateModel model1 =
      QrGenerateModel(LocaleKeys.generate_qr_qr_options_qr_text_label.tr(), Icons.paste_outlined, Colors.green);
  @observable
  QrGenerateModel model2 = QrGenerateModel(
      LocaleKeys.generate_qr_qr_options_qr_contact_label.tr(), Icons.contact_phone_outlined, Colors.deepOrange);
  @observable
  QrGenerateModel model3 =
      QrGenerateModel(LocaleKeys.generate_qr_qr_options_qr_social_label.tr(), Icons.facebook_outlined, Colors.blue);
  @observable
  QrGenerateModel model4 =
      QrGenerateModel(LocaleKeys.generate_qr_qr_options_qr_website_label.tr(), FontAwesomeIcons.globe, Colors.amber);
  @observable
  QrGenerateModel model5 =
      QrGenerateModel(LocaleKeys.generate_qr_qr_options_qr_message_label.tr(), Icons.message_outlined, Colors.purple);
  @observable
  QrGenerateModel model6 =
      QrGenerateModel(LocaleKeys.generate_qr_qr_options_qr_location_label.tr(), Icons.location_on_outlined, Colors.red);
  @observable
  QrGenerateModel model7 = QrGenerateModel(
      LocaleKeys.generate_qr_qr_options_qr_mail_label.tr(), Icons.mail_outline_outlined, Colors.redAccent);
  @observable
  QrGenerateModel model8 = QrGenerateModel(
      LocaleKeys.generate_qr_qr_options_qr_other_label.tr(), Icons.question_mark_outlined, Colors.orange);

  @computed
  List<QrGenerateModel> get QRmodels => [model1, model2, model3, model4, model5, model6, model7, model8];

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
    qrCodeOptionsEnum = QrCodeOptionsEnum.values.elementAt(index);
  }

  @action
  void changeLoading() {
    isloading = !isloading;
  }

  @action
  void navigateAndBuildQR() {
    var textForQr = "";
    var textForDisplay = "";

    switch (qrCodeOptionsEnum) {
      case QrCodeOptionsEnum.text:
        textForQr = "${textEditingController1?.text}";
        textForDisplay = textForQr;
        break;
      case QrCodeOptionsEnum.contact:
        textForQr = 'BEGIN:VCARD\n'
            'VERSION:3.0\n'
            'N:${textEditingController1?.text}\n'
            'TEL;TYPE=CELL:${textEditingController2?.text}\n'
            'EMAIL:${textEditingController3?.text}\n'
            'END:VCARD';
        textForDisplay =
            "${textEditingController1?.text}\n${textEditingController2?.text}\n${textEditingController3?.text}";
        break;
      case QrCodeOptionsEnum.social:
        switch (socialMediaEnums) {
          case SocialMediaEnums.Instagram:
            textForQr = "https://www.instagram.com/${textEditingController1?.text}";
            break;
          case SocialMediaEnums.Facebook:
            textForQr = "https://www.facebook.com/${textEditingController1?.text}";
            break;
          case SocialMediaEnums.Twitter:
            textForQr = "https://www.twitter.com/${textEditingController1?.text}";
            break;
          case SocialMediaEnums.Snapchat:
            textForQr = "https://www.snapchat.com/${textEditingController1?.text}";
            break;
        }
        textForDisplay = textForQr;
        break;
      case QrCodeOptionsEnum.url:
        textForQr = "${textEditingController1?.text}";
        textForDisplay = textForQr;
        break;
      case QrCodeOptionsEnum.message:
        textForQr = "${textEditingController1?.text}";
        textForDisplay = textForQr;
        break;
      case QrCodeOptionsEnum.location:
        textForQr = '${textEditingController1?.text} ${textEditingController2?.text} ${textEditingController3?.text}';
        textForDisplay = "$textForQr \n location qr codes does not cretes properly";
        break;
      case QrCodeOptionsEnum.email:
        textForQr =
            'mailto:${textEditingController1?.text}?subject=${textEditingController2?.text}&body=${textEditingController3?.text}';
        textForDisplay =
            '${textEditingController1?.text}\n${textEditingController2?.text}\n${textEditingController3?.text}';

        break;
      case QrCodeOptionsEnum.other:
        textForQr = "${textEditingController1?.text}";
        break;
    }

    if ((formState.currentState?.validate() ?? true) == false) {
      return;
    }
    //navigationService.router.go("${NavigationEnums.generatedQrView.routeName}/:$textForQr");
    Navigator.push(
        baseContext,
        MaterialPageRoute(
            builder: ((context) => GeneratedQrView(
                qrType: qrCodeOptionsEnum.names, qrData: textForQr, qrDataForDisplay: textForDisplay))));
  }

  @action
  void changeSocialEnum(SocialMediaEnums socialEnum) {
    socialMediaEnums = socialEnum;
  }
}
