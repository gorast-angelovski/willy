import 'package:willy/model/account.dart';

List<User> users = [
  User("Gorast", "Angelovski", "gorast.angelovski1@gmail.com",
      "Password123!", "ExecutorPin123")
];

List<User> loggedIn = [];

class User {
  String name;
  String surname;
  String email;
  String password;
  String executorPin;
  // List<Account> accounts;
  // String executorEmail;


  @override
  String toString() {
    return 'SignUpForm{name: $name, surname: $surname, email: $email, password: $password, executorPin: $executorPin}';
  }

  User(
      this.name, this.surname, this.email, this.password, this.executorPin);
}


