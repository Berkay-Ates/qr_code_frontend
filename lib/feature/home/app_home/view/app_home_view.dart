import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/cache/cache_enums.dart';
import '../../../../core/init/cache/shared_manager.dart';
import '../../../../core/init/cache/shared_object.dart';
import '../../qr_generate/view/qr_generate_view.dart';
import '../../qr_history/view/qr_history_view.dart';
import '../view_model/app_home_view_model.dart';

class AppHomeView extends StatefulWidget {
  const AppHomeView({super.key});

  @override
  State<AppHomeView> createState() => _AppHomeViewState();
}

class _AppHomeViewState extends State<AppHomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<AppHomeViewModel>(
      viewModel: AppHomeViewModel(),
      onModelReady: ((viewModel) {
        viewModel.init();
        viewModel.setContext(context);
        viewModel.tabController = TabController(length: 3, vsync: this);
      }),
      onPageBuilder: ((context, viewModel) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            extendBody: true,
            drawer: const Drawer(),
            appBar: AppBar(
              title: Observer(builder: (_) {
                return viewModel.pageIndex == 0 ? const Text("History") : const Text("Generate");
              }),
              actions: [
                IconButton(
                    onPressed: (() async {
                      final sharedprefObj = SharedPrefObject.instance;
                      await sharedprefObj?.initShared();
                      final sharedManager = SharedManger(sharedprefObj?.getSharedObject);
                      await sharedManager.removeData(CacheEnumKeys.TOKEN.name);
                    }),
                    icon: const Icon(Icons.clear_sharp))
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: Theme.of(context).colorScheme.onSurface,
              child: TabBar(
                controller: viewModel.tabController,
                isScrollable: false,
                onTap: (value) => viewModel.chandePageIndex(value),
                tabs: const [
                  Tab(
                    iconMargin: EdgeInsets.all(3),
                    icon: Icon(Icons.add_box_outlined, size: 32),
                    child: Text("   Generate   "),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.all(3),
                    icon: Icon(Icons.qr_code_scanner_outlined, size: 32),
                    child: Text("   Scan   "),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.all(3),
                    icon: Icon(Icons.history, size: 32),
                    child: Text("   History   "),
                  )
                ],
                labelStyle: Theme.of(context).textTheme.button?.copyWith(),
                unselectedLabelStyle: Theme.of(context).textTheme.button,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
                indicatorColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: viewModel.tabController,
                children: [const QrGenerateView(), Container(color: Colors.red), const QrHistoryView()]),
          ),
        );
      }),
    );
  }
}
