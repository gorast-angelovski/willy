class Account {
  String _platform;
  String _usernameOrEmail;
  String _password;

  Account(this._platform, this._usernameOrEmail, this._password);

  String getPlatform() {
    return _platform;
  }
  String getUserNameOrEmail() {
    return _usernameOrEmail;
  }
  String getPassword() {
    return _password;
  }

  void setPlatform(String platform) {
    _platform = platform;
  }
  void setUsernameOrEmail(String usernameOrEmail) {
    _usernameOrEmail = usernameOrEmail;
  }
  void setPassword(String password) {
    _password = password;
  }
}
