class Cashflow {

  int? id;
  String personName;
  String type; // loan or debt on String
  double value;
  String? date;
  String? note;
  int? paid;

  Cashflow(
      {this.id,
      required this.personName,
      required this.type,
      required this.value,
      this.date,
      this.note,
      this.paid});

  Cashflow toCashflow(Map<String, dynamic> listItem) {
    return Cashflow(
        id: listItem['id'],
        personName: listItem['personName'],
        type: listItem['type'],
        value: listItem['value'],
        date: listItem['date'],
        note: listItem['note'],
        paid: listItem['paid']);
  }

}
