class ApplicationUser {
  final String uid;

  ApplicationUser({required this.uid});
}

class ApplicationUserData {
  final String uid;
  final String name;
  final String surname;
  final String executorPin;

  ApplicationUserData(
      {required this.uid,
      required this.name,
      required this.surname,
      required this.executorPin});
}
