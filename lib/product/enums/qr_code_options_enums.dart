enum QrCodeOptionsEnum {
  text('text'),
  contact('contact'),
  phone('social'),
  url('url'),
  message('message'),
  location('location'),
  email('email'),
  other('other');

  final String names;
  const QrCodeOptionsEnum(this.names);
}
