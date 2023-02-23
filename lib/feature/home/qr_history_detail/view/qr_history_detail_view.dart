import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_code/core/init/lang/locale_keys.g.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:qr_code/product/paddings/app_paddings.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../product/enums/qr_code_options_enums.dart';
import '../../qr_history/model/gen_scan_qr_models.dart';
import '../model_view/qr_history_detail_view_model.dart';

class QrHistoryDetailView extends StatelessWidget {
  const QrHistoryDetailView({
    Key? key,
    this.userQrData,
  }) : super(key: key);

  final UserQrData? userQrData;
  @override
  Widget build(BuildContext context) {
    return BaseView<QrHistoryDetailViewModel>(
        viewModel: QrHistoryDetailViewModel(),
        onModelReady: ((viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        }),
        onPageBuilder: ((context, viewModel) {
          return Scaffold(
              appBar: AppBar(
                title: Text(LocaleKeys.generated_qr_view_gen_title.tr()),
              ),
              body: Center(
                child: Padding(
                  padding: AppPaddings.xlargeAllPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QrImage(data: userQrData?.qrData ?? "", size: 200),
                      ListTile(
                        contentPadding: AppPaddings.largeAllPadding,
                        leading: viewModel.getQrAvatars(
                            QrCodeOptionsEnum.values.firstWhere((element) => element.names == userQrData?.qrType)),
                        title: Text(userQrData?.displayQrData ?? 'NULL',
                            style: Theme.of(context).textTheme.headlineSmall, maxLines: 8, overflow: TextOverflow.fade),
                      ),
                      Observer(builder: (_) {
                        return viewModel.isQrDeleted
                            ? Column(children: [
                                Padding(
                                  padding: AppPaddings.mediumVerticalPadding,
                                  child: Text(
                                    LocaleKeys.generated_qr_view_delete_qr_info.tr(),
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(LocaleKeys.generated_qr_view_back.tr()),
                                )
                              ])
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        inspect(userQrData);
                                        await viewModel.deleteQr(userQrData?.id ?? "");
                                      },
                                      child: viewModel.isLoading
                                          ? CircularProgressIndicator(
                                              color: Theme.of(context).colorScheme.onSurface,
                                            )
                                          : Text(LocaleKeys.generated_qr_view_delete.tr())),
                                  ElevatedButton(
                                      onPressed: viewModel.isLoading ? () {} : () => Navigator.pop(context),
                                      child: Text(
                                        LocaleKeys.generated_qr_view_back.tr(),
                                      )),
                                ],
                              );
                      })
                    ],
                  ),
                ),
              ));
        }));
  }
}
