import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  void initState() {
    super.initState();
    debugPrint("qrHistory init called ");
  }

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
                tabs: const [Tab(child: Text(" Scanned ")), Tab(child: Text(" Generated "))],
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
                child: TabBarView(
                    controller: viewModel.tabController, children: [buildQrFeeds(viewModel), buildQrFeeds(viewModel)]),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildQrFeeds(QrHistoryViewModel viewModel) {
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
                                subtitle:
                                    const Text("lorem text string data key style struct style hello locale someth"))),
                      ))));
    });
  }
}
