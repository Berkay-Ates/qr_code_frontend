part of 'qr_generate_view.dart';

Widget buildQrCodeGenerateField(QrGenerateViewModel viewModel) {
  viewModel.formState.currentState?.reset();
  switch (viewModel.qrCodeOptionsEnum) {
    case QrCodeOptionsEnum.text:
      return buildQrTextGenerate(LocaleKeys.generate_qr_qr_options_qr_text_label.tr(), viewModel);
    case QrCodeOptionsEnum.contact:
      return buildQrContactGenerateSimple(LocaleKeys.generate_qr_qr_options_qr_contact_label.tr(), viewModel);
    case QrCodeOptionsEnum.social:
      return buildQrSocialGenerate(LocaleKeys.generate_qr_qr_options_qr_social_label.tr(), viewModel);
    case QrCodeOptionsEnum.url:
      return buildQrTextGenerate(LocaleKeys.generate_qr_qr_options_qr_website_label.tr(), viewModel);
    case QrCodeOptionsEnum.message:
      return buildQrTextGenerate(LocaleKeys.generate_qr_qr_options_qr_message_label.tr(), viewModel);
    case QrCodeOptionsEnum.location:
      return buildQrLocationGenerate(LocaleKeys.generate_qr_qr_options_qr_location_label.tr(), viewModel);
    case QrCodeOptionsEnum.email:
      return buildQrMailGenerate(LocaleKeys.generate_qr_qr_options_qr_mail_label.tr(), viewModel);
    case QrCodeOptionsEnum.other:
      return buildQrTextGenerate(LocaleKeys.generate_qr_qr_options_qr_other_label.tr(), viewModel);
  }
}

Column buildQrMailGenerate(String qrType, QrGenerateViewModel viewModel) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(qrType),
          IconButton(
              onPressed: () {
                viewModel.textEditingController1?.clear();
                viewModel.textEditingController2?.clear();
                viewModel.textEditingController3?.clear();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      TextFormField(
          controller: viewModel.textEditingController1,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(Icons.call_received_outlined),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_mail_receiver.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController2,
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(Icons.subject_outlined),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_mail_subject.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController3,
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(Icons.mail_outline_outlined),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_mail_content.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero)))
    ],
  );
}

Column buildQrLocationGenerate(String qrType, QrGenerateViewModel viewModel) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(qrType), IconButton(onPressed: () {}, icon: const Icon(Icons.clear))],
      ),
      TextFormField(
          controller: viewModel.textEditingController1,
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(Icons.location_city_outlined),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_location_city.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController2,
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(Icons.streetview_outlined),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_location_street.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController3,
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(Icons.home_outlined),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_location_home.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero))),
    ],
  );
}

Widget buildQrSocialGenerate(String qrType, QrGenerateViewModel viewModel) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(qrType),
          IconButton(
              onPressed: () {
                viewModel.textEditingController1?.clear();
                viewModel.textEditingController2?.clear();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      TextFormField(
          controller: viewModel.textEditingController1,
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(FontAwesomeIcons.facebook),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_social_hint.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      Padding(
        padding: const EdgeInsets.only(top: 28),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          buildSocialAccountText(SocialMediaEnums.Facebook, viewModel),
          buildSocialAccountText(SocialMediaEnums.Instagram, viewModel),
          buildSocialAccountText(SocialMediaEnums.Twitter, viewModel),
          buildSocialAccountText(SocialMediaEnums.Snapchat, viewModel),
        ]),
      )
    ],
  );
}

InkWell buildSocialAccountText(SocialMediaEnums socialEnum, QrGenerateViewModel viewModel) {
  return InkWell(
      onTap: () => viewModel.changeSocialEnum(socialEnum),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          socialEnum.name,
          style: Theme.of(viewModel.baseContext).textTheme.bodyLarge?.copyWith(
              color: viewModel.socialMediaEnums == socialEnum
                  ? Theme.of(viewModel.baseContext).colorScheme.primary
                  : Theme.of(viewModel.baseContext).colorScheme.onSecondary),
        ),
      ));
}

Column buildQrContactGenerateSimple(String qrType, QrGenerateViewModel viewModel) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(qrType),
          IconButton(
              onPressed: () {
                viewModel.textEditingController1?.clear();
                viewModel.textEditingController2?.clear();
                viewModel.textEditingController3?.clear();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      TextFormField(
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          controller: viewModel.textEditingController1,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(Icons.person_outline_outlined),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_contact_hint_name.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          controller: viewModel.textEditingController2,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(Icons.phone_outlined),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_contact_hint_phone.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController3,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              icon: const Icon(Icons.email_outlined),
              focusedBorder: const UnderlineInputBorder(),
              hintText: LocaleKeys.generate_qr_qr_options_qr_contact_email.tr(),
              border: const UnderlineInputBorder(borderRadius: BorderRadius.zero))),
    ],
  );
}

Column buildQrContactGenerate(String qrType, QrGenerateViewModel viewModel) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(qrType),
          IconButton(
              onPressed: () {
                viewModel.textEditingController1?.clear();
                viewModel.textEditingController2?.clear();
                viewModel.textEditingController3?.clear();
                viewModel.textEditingController4?.clear();
                viewModel.textEditingController5?.clear();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      TextFormField(
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          controller: viewModel.textEditingController1,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.person_outline_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "name",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
          controller: viewModel.textEditingController2,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.phone_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "phone-number",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController3,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.email_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "email",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController4,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              icon: Icon(Icons.work_outline_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "work",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController5,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.streetAddress,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.location_city_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "address",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero)))
    ],
  );
}

Column buildQrTextGenerate(String label, QrGenerateViewModel viewModel) {
  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, textAlign: TextAlign.start),
        IconButton(
            onPressed: () {
              viewModel.textEditingController1?.clear();
            },
            icon: const Icon(Icons.clear))
      ],
    ),
    TextFormField(
      controller: viewModel.textEditingController1,
      validator: (value) => (value?.isEmpty ?? true) ? LocaleKeys.generate_qr_empty_error.tr() : null,
      minLines: 1,
      maxLines: 5,
      decoration: InputDecoration(
          alignLabelWithHint: false,
          icon: const Icon(Icons.text_fields_outlined),
          focusedBorder: const UnderlineInputBorder(),
          hintText: LocaleKeys.generate_qr_qr_options_qr_text_hint.tr(),
          border: const UnderlineInputBorder(borderRadius: BorderRadius.zero)),
    )
  ]);
}

Widget buildGridView(BuildContext context, QrGenerateViewModel viewModel) {
  return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
          child: Card(
            shape: RoundedRectangleBorder(
                side: viewModel.selectedIndex == index
                    ? BorderSide(color: Theme.of(context).colorScheme.primary)
                    : BorderSide.none,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            color: Theme.of(context).colorScheme.onSurface,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: viewModel.QRmodels[index].colors,
                  child: Icon(
                    viewModel.QRmodels[index].icons,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      }));
}
