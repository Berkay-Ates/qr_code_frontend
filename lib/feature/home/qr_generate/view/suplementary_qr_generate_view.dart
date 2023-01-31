part of 'qr_generate_view.dart';

Widget buildQrCodeGenerateField(QrGenerateViewModel viewModel) {
  viewModel.formState.currentState?.reset();
  switch (viewModel.qrCodeOptionsEnum) {
    case QrCodeOptionsEnum.text:
      return buildQrTextGenerate("Text", viewModel);
    case QrCodeOptionsEnum.contact:
      return buildQrContactGenerate("Contact", viewModel);
    case QrCodeOptionsEnum.social:
      return buildQrSocialGenerate("Social", viewModel);
    case QrCodeOptionsEnum.url:
      return buildQrTextGenerate("Web Url", viewModel);
    case QrCodeOptionsEnum.message:
      return buildQrTextGenerate("Message", viewModel);
    case QrCodeOptionsEnum.location:
      return buildQrLocationGenerate("Location", viewModel);
    case QrCodeOptionsEnum.email:
      return buildQrMailGenerate("Mail", viewModel);
    case QrCodeOptionsEnum.other:
      return buildQrTextGenerate("Other", viewModel);
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
                viewModel.textEditingController4?.clear();
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      TextFormField(
          controller: viewModel.textEditingController1,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.call_received_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "receiver",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController2,
          validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.call_made_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "sender",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController3,
          validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.subject_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "subject",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController4,
          validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.mail_outline_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "mail-content",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero)))
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
          validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.location_city_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "city",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController2,
          validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.streetview_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "street",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController3,
          validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.home_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "home",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController4,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(Icons.extension_outlined),
              focusedBorder: UnderlineInputBorder(),
              hintText: "extra information",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
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
          validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              alignLabelWithHint: false,
              icon: Icon(FontAwesomeIcons.facebook),
              focusedBorder: UnderlineInputBorder(),
              hintText: "social media url",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero))),
      TextFormField(
          controller: viewModel.textEditingController2,
          minLines: 1,
          maxLines: 3,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              icon: Icon(Icons.text_fields),
              focusedBorder: UnderlineInputBorder(),
              hintText: "message",
              border: UnderlineInputBorder(borderRadius: BorderRadius.zero)))
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
          validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
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
          validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
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
      validator: (value) => (value?.isEmpty ?? true) ? "this field could not be empty" : null,
      minLines: 2,
      maxLines: 5,
      decoration: const InputDecoration(
          alignLabelWithHint: false,
          icon: Icon(Icons.text_fields_outlined),
          focusedBorder: UnderlineInputBorder(),
          hintText: "please fill in the text here",
          border: UnderlineInputBorder(borderRadius: BorderRadius.zero)),
    )
  ]);
}

//* text, contact, phoneNumber, website, location, diger, sms, email
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
