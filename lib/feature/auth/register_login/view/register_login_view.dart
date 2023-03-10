import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_code/core/init/lang/language_manager.dart';
import 'package:qr_code/core/init/lang/locale_keys.g.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/durations/app_durations.dart';
import '../../../../core/extension/device_properties/device_properties.dart';
import '../../../../core/extension/validator/email_validator.dart';
import '../../../../product/enums/image_enums.dart';
import '../../../../product/paddings/app_paddings.dart';
import '../view_model/register_login_view_model.dart';

class RegisterLoginView extends StatefulWidget {
  const RegisterLoginView({super.key});

  @override
  State<RegisterLoginView> createState() => _RegisterLoginViewState();
}

class _RegisterLoginViewState extends State<RegisterLoginView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterLoginViewModel>(
        viewModel: RegisterLoginViewModel(),
        onModelReady: ((model) {
          model.setContext(context);
          model.init();
          model.tabController = TabController(length: 2, vsync: this);
        }),
        onPageBuilder: ((context, viewModel) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              key: viewModel.scaffoldState,
              backgroundColor: Colors.grey[200],
              body: SafeArea(
                child: Column(
                  children: [
                    Column(
                      children: [buildAnimatedcontainer(context), buildTabbarContainer(context, viewModel)],
                    ),
                    Expanded(
                        flex: 6,
                        child: Padding(
                          padding: AppPaddings.xlargeHorizontalPadding,
                          child: buildForm(viewModel, context),
                        )),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  AnimatedContainer buildAnimatedcontainer(BuildContext context) {
    return AnimatedContainer(
      color: Theme.of(context).colorScheme.onPrimary,
      height: MediaQuery.of(context).viewInsets.bottom > 0 ? 0 : (context.deviceWidth ?? 100) * 0.50,
      duration: AppDurations.xdurationLow,
      child: Padding(
        padding: AppPaddings.xlargeAllPadding,
        child: Center(child: Image.asset(ImageEnumName.small.imagePath)),
      ),
    );
  }

  Widget buildTabbarContainer(BuildContext context, RegisterLoginViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 2),
        child: buildTabbar(context, viewModel),
      ),
    );
  }

  Widget buildTabbar(BuildContext context, RegisterLoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TabBar(
        controller: viewModel.tabController,
        onTap: (value) {
          viewModel.changePage(value);
        },
        tabs: [Tab(text: LocaleKeys.register_login_login.tr()), Tab(text: LocaleKeys.register_login_signUp.tr())],
        labelStyle: Theme.of(context).textTheme.headline5,
        unselectedLabelStyle: Theme.of(context).textTheme.headline6,
        indicatorPadding: AppPaddings.smallAllPadding,
        indicatorWeight: 3,
        labelColor: Theme.of(context).colorScheme.onSecondary,
        indicatorColor: Theme.of(context).colorScheme.primary,
      );
    });
  }

  Form buildForm(RegisterLoginViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      child: Observer(builder: (_) {
        return Column(
          children: [
            viewModel.pageIndex == 1 ? buildPersonTextField(viewModel) : const SizedBox.shrink(),
            buildFormFieldEmail(viewModel),
            buildFormFieldPassword(viewModel),
            buildForgotPasswordText(context),
            const Spacer(),
            buildLoginButton(context, viewModel),
            buildWrapForgot(context, viewModel)
          ],
        );
      }),
    );
  }

  TextFormField buildFormFieldPassword(RegisterLoginViewModel viewModel) {
    return TextFormField(
        textInputAction: TextInputAction.done,
        controller: viewModel.passwordController,
        obscureText: !viewModel.islock,
        validator: (value) => (value?.length ?? 0) > 5 ? null : LocaleKeys.register_login_stronger_password.tr(),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                viewModel.changeVisibility();
              },
              icon: AnimatedCrossFade(
                  firstChild: const Icon(Icons.visibility_outlined),
                  secondChild: const Icon(Icons.visibility_off_outlined),
                  crossFadeState: viewModel.islock ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: AppDurations.durationMedium),
            ),
            labelText: LocaleKeys.register_login_password.tr(),
            icon: const Icon(Icons.lock_outline)));
  }

  TextFormField buildPersonTextField(RegisterLoginViewModel viewModel) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: viewModel.nameController,
      validator: (value) => value?.isNotEmpty ?? false ? null : LocaleKeys.register_login_name_required.tr(),
      decoration: InputDecoration(
          labelText: LocaleKeys.register_login_name.tr(), icon: const Icon(Icons.person_outline_outlined)),
    );
  }

  TextFormField buildFormFieldEmail(RegisterLoginViewModel viewModel) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      controller: viewModel.emailController,
      validator: (value) => value?.isValidMail ?? false ? null : LocaleKeys.register_login_valid_email.tr(),
      decoration: const InputDecoration(labelText: "email", icon: Icon(Icons.email_outlined)),
    );
  }

  Widget buildForgotPasswordText(BuildContext context) => Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text(
                "You will be able to reset your password as soon as possible.",
                textAlign: TextAlign.center,
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
            ));
          },
          child: Text(LocaleKeys.register_login_forgot_passw.tr())));

  ElevatedButton buildLoginButton(BuildContext context, RegisterLoginViewModel viewModel) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const StadiumBorder(), padding: AppPaddings.xlargeAllPadding),
      onPressed: viewModel.isloading
          ? () {}
          : viewModel.isloginPage
              ? () => viewModel.loginUser()
              : () => viewModel.registerUser(),
      child: Center(
          child: viewModel.isloading == true
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.surface,
                ))
              : Text(
                  viewModel.pageIndex == 0
                      ? LocaleKeys.register_login_entor_to_app.tr()
                      : LocaleKeys.register_login_create_account.tr(),
                  style:
                      Theme.of(context).textTheme.headline5?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                )),
    );
  }

  Wrap buildWrapForgot(BuildContext context, RegisterLoginViewModel viewModel) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(LocaleKeys.register_login_no_account.tr()),
        TextButton(
            onPressed: (() {
              viewModel.tabController?.animateTo(1);
              viewModel.changePage(1);
            }),
            child: Text(LocaleKeys.register_login_signUp.tr()))
      ],
    );
  }
}
