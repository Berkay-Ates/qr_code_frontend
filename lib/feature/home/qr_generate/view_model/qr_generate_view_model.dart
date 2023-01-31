import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code/product/enums/qr_code_options_enums.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../model/ar_generate_model.dart';

part 'qr_generate_view_model.g.dart';

class QrGenerateViewModel = _QrGenerateViewModelBase with _$QrGenerateViewModel;

abstract class _QrGenerateViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  // * forma key atıyoruz form icerisindeki textFieldlara validator yazıyoruz formun keyi uzerinden validatae
  //* ettigimizde form icerisindeki elemanların controllerları calısmıs oluyor.

  @override
  void setContext(BuildContext context) => baseContext = context;

  @observable
  int selectedIndex = 0;

  @observable
  QrCodeOptionsEnum qrCodeOptionsEnum = QrCodeOptionsEnum.text;

  @override
  void init() {}

  QrGenerateModel model1 = QrGenerateModel('Text', Icons.paste_outlined, Colors.green);
  QrGenerateModel model2 = QrGenerateModel('Contact', Icons.contact_phone_outlined, Colors.deepOrange);
  QrGenerateModel model3 = QrGenerateModel('Social', Icons.facebook_outlined, Colors.blue);
  QrGenerateModel model4 = QrGenerateModel('Website', FontAwesomeIcons.globe, Colors.amber);
  QrGenerateModel model5 = QrGenerateModel('Message', Icons.message_outlined, Colors.purple);
  QrGenerateModel model6 = QrGenerateModel('Location', Icons.location_on_outlined, Colors.red);
  QrGenerateModel model7 = QrGenerateModel('Mail', Icons.mail_outline_outlined, Colors.redAccent);
  QrGenerateModel model8 = QrGenerateModel('Other', Icons.question_mark_outlined, Colors.orange);

  @computed
  List<QrGenerateModel> get QRmodels => [model1, model2, model3, model4, model5, model6, model7, model8];

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
    qrCodeOptionsEnum = QrCodeOptionsEnum.values.elementAt(index);
  }
}
