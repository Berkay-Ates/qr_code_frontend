enum ImageEnumName {
  big("ic_app_big"),
  normal("ic_app_normal"),
  small("ic_app_small"),
  svg0("ic_onboard_0"),
  svg1("ic_onboard_1"),
  svg2("ic_onboard_2");

  final String name;
  const ImageEnumName(this.name);

  String get imagePath => "asset/image/$name.png";
  String get svgPath => "asset/svg/$name.svg";
}
