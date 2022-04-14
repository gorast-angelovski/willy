class ApplicationUser {
  final String uid;

  ApplicationUser({required this.uid});
}

class ApplicationUserData {
  String uid;
  String name;
  String surname;
  String executorPin;
  String executorEmail = "";

  ApplicationUserData(
      {required this.uid,
      required this.name,
      required this.surname,
      required this.executorPin,
      required this.executorEmail});
}
