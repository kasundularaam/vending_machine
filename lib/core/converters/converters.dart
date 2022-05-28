String age(String birthDate) {
  int year = int.parse(birthDate.split("-")[0]);
  DateTime dob = DateTime(year);
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - dob.year;
  return "$age";
}
