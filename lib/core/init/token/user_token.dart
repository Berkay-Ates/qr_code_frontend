class UserToken {
  static UserToken? _UserToken;
  static UserToken get instance {
    _UserToken ??= UserToken._();
    return _UserToken!;
  }

  String token = '';
  void setToken(String token) => this.token = token;

  String get getToken => token;

  UserToken._();
}
