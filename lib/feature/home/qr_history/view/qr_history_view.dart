import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_code/core/init/lang/locale_keys.g.dart';
import 'package:qr_code/feature/home/qr_history_detail/view/qr_history_detail_view.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/device_properties/device_properties.dart';
import '../../../../product/enums/qr_code_options_enums.dart';
import '../../../../product/paddings/app_paddings.dart';
import '../view_model/qr_history_view_model.dart';

class QrHistoryView extends StatefulWidget {
  const QrHistoryView({super.key});

  @override
  State<QrHistoryView> createState() => _QrHistoryViewState();
}

class _QrHistoryViewState extends State<QrHistoryView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<QrHistoryViewModel>(
      viewModel: QrHistoryViewModel(),
      onModelReady: ((viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        viewModel.tabController = TabController(length: 2, vsync: this);
      }),
      onPageBuilder: ((context, viewModel) {
        return DefaultTabController(
          length: 2,
          child: ListView(
            children: [
              TabBar(
                controller: viewModel.tabController,
                isScrollable: false,
                tabs: [
                  Tab(child: Text(" ${LocaleKeys.qr_history_scanned.tr()} ")),
                  Tab(child: Text(" ${LocaleKeys.qr_history_app_bar.tr()}  "))
                ],
                labelStyle: Theme.of(context).textTheme.titleMedium,
                unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
                indicatorColor: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(
                height: (context.deviceHeight ?? 100) * 0.80,
                child: TabBarView(controller: viewModel.tabController, children: [
                  Center(
                      child: Text(
                    LocaleKeys.qr_history_scanned_qr_cant_save_info.tr(),
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).colorScheme.error),
                    textAlign: TextAlign.center,
                  )),
                  buildGeneratedQrFeeds(viewModel)
                ]),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildGeneratedQrFeeds(QrHistoryViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.generatedQrCodes == null
          ? const Center(child: CircularProgressIndicator())
          : viewModel.generatedQrCodes?.userQrData?.isEmpty ?? true
              ? Center(
                  child: Text(LocaleKeys.qr_history_no_saved_qr.tr(),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                      textAlign: TextAlign.center))
              : Padding(
                  padding: AppPaddings.mediumHorizontalPadding,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: ListView.builder(
                        itemCount: viewModel.generatedQrCodes?.userQrData?.length ?? 0,
                        itemBuilder: ((context, index) => Padding(
                              padding: AppPaddings.smallVerticalPadding,
                              child: Card(
                                  child: ListTile(
                                onTap: () async {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => QrHistoryDetailView(
                                              userQrData: viewModel.generatedQrCodes?.userQrData?[index]))));

                                  await viewModel.getUserGeneratedQrCodes();
                                },
                                contentPadding: AppPaddings.largeAllPadding,
                                leading: viewModel.getQrAvatars(QrCodeOptionsEnum.values.firstWhere((element) =>
                                    element.names == viewModel.generatedQrCodes?.userQrData?[index].qrType)),
                                title: Text(
                                  viewModel.generatedQrCodes?.userQrData?[index].displayQrData ?? 'NULL',
                                  style: Theme.of(context).textTheme.titleLarge,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                            ))),
                  ));
    });
  }

  Widget buildScannedQrFeeds(QrHistoryViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.scannedQrCodes == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: AppPaddings.largeHorizontalPadding,
              child: ListView.builder(
                  itemCount: viewModel.scannedQrCodes?.userQrData?.length ?? 0,
                  itemBuilder: ((context, index) => Padding(
                        padding: AppPaddings.smallVerticalPadding,
                        child: Card(
                            child: ListTile(
                          contentPadding: AppPaddings.largeAllPadding,
                          leading: viewModel.getQrAvatars(QrCodeOptionsEnum.values.firstWhere(
                              (element) => element.names == viewModel.scannedQrCodes?.userQrData?[index].qrType)),
                          title: Text(viewModel.scannedQrCodes?.userQrData?[index].qrData ?? 'NULL',
                              style: Theme.of(context).textTheme.titleLarge),
                        )),
                      ))));
    });
  }
}
