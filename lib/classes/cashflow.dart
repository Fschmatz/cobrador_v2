class Cashflow {

  int id;
  String personName;
  String type; // loan or debt on String
  double value;
  DateTime date;
  String note;
  int paid;

  Cashflow(
      {required this.id,
        required this.personName,
        required this.type,
        required this.value,
        required this.date,
        required this.note,
        required this.paid});
}
