enum QrCodeOptionsEnum {
  text('text'),
  contact('contact'),
  social('social'),
  url('url'),
  message('message'),
  location('location'),
  email('email'),
  other('other');

  final String names;
  const QrCodeOptionsEnum(this.names);
}
