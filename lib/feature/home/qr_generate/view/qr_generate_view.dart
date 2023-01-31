import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../product/enums/qr_code_options_enums.dart';
import '../../../../product/paddings/app_paddings.dart';
import '../view_model/qr_generate_view_model.dart';

class QrGenerateView extends StatelessWidget {
  const QrGenerateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<QrGenerateViewModel>(
      viewModel: QrGenerateViewModel(),
      onModelReady: ((viewModel) {}),
      onPageBuilder: ((context, viewModel) {
        return Scaffold(
          key: viewModel.scaffoldState,
          body: Column(
            children: [
              Observer(builder: (_) {
                return Card(
                  margin: const EdgeInsets.all(12),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Column(
                    children: [
                      Form(
                        key: viewModel.formState,
                        child: Padding(
                          padding: AppPaddings.largeAllPadding,
                          child: buildQrCodeGenerateField(viewModel),
                        ),
                      ),
                      TextButton(onPressed: (() {}), child: const Text("create"))
                    ],
                  ),
                );
              }),
              Expanded(
                  child: Padding(
                padding: AppPaddings.largeAllPadding,
                child: buildGridView(context, viewModel),
              )),
            ],
          ),
        );
      }),
    );
  }

  Widget buildQrCodeGenerateField(QrGenerateViewModel viewModel) {
    switch (viewModel.qrCodeOptionsEnum) {
      case QrCodeOptionsEnum.text:
        return buildQrTextGenerate();
      case QrCodeOptionsEnum.contact:
        return Column(
          children: [
            TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    alignLabelWithHint: false,
                    icon: Icon(Icons.person_outline_outlined),
                    focusedBorder: UnderlineInputBorder(),
                    hintText: "Name",
                    border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
            TextFormField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    alignLabelWithHint: false,
                    icon: Icon(Icons.phone_outlined),
                    focusedBorder: UnderlineInputBorder(),
                    hintText: "Phone-Number",
                    border: UnderlineInputBorder(borderRadius: BorderRadius.zero)))
          ],
        );
      case QrCodeOptionsEnum.phone:
        return Column(
          children: [
            TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    alignLabelWithHint: false,
                    icon: Icon(FontAwesomeIcons.facebook),
                    focusedBorder: UnderlineInputBorder(),
                    hintText: "any social media url",
                    border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
            TextFormField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    icon: Icon(Icons.text_fields),
                    focusedBorder: UnderlineInputBorder(),
                    hintText: "your message",
                    border: UnderlineInputBorder(borderRadius: BorderRadius.zero)))
          ],
        );
      case QrCodeOptionsEnum.url:
        return const Text('website Qr field builded');
      case QrCodeOptionsEnum.message:
        return const Text('message Qr field builded');
      case QrCodeOptionsEnum.location:
        return const Text('location Qr field builded');
      case QrCodeOptionsEnum.email:
        return const Text('mail Qr field builded');
      case QrCodeOptionsEnum.other:
        return const Text('other Qr field builded');
    }
  }

  Column buildQrTextGenerate() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Text:", textAlign: TextAlign.start),
          IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
        ],
      ),
      TextFormField(
        validator: (value) => (value?.length ?? 150) < 150 ? null : "please decrease text length",
        minLines: 6,
        maxLines: 8,
        decoration: const InputDecoration(
          hintText: "Please fill in the text here",
          border: InputBorder.none,
        ),
      )
    ]);
  }

//* text, contact, phoneNumber, website, location, diger, sms, email
  Widget buildGridView(BuildContext context, QrGenerateViewModel viewModel) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        itemCount: viewModel.QRmodels.length,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              viewModel.setSelectedIndex(index);
            },
            child: Observer(builder: (_) {
              return Card(
                shape: RoundedRectangleBorder(
                    side: viewModel.selectedIndex == index
                        ? BorderSide(color: Theme.of(context).colorScheme.primary)
                        : BorderSide.none,
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                color: Theme.of(context).colorScheme.onSurface,
                child: Padding(
                  padding: AppPaddings.largeAllPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: AppPaddings.smallBottomPaddings,
                        child: CircleAvatar(
                          backgroundColor: viewModel.QRmodels[index].colors,
                          child: Icon(
                            viewModel.QRmodels[index].icons,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      AutoSizeText(
                        viewModel.QRmodels[index].name,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        }));
  }
}
