import 'package:jiffy/jiffy.dart';

class Cashflow {

  int? id;
  String personName;
  String type; // loan or debt on String
  double value;
  String? date;
  String? note;
  int? paid;
  String? paidDate;

  Cashflow(
      {this.id,
      required this.personName,
      required this.type,
      required this.value,
      this.date,
      this.note,
      this.paid,
      this.paidDate});

  Cashflow toCashflow(Map<String, dynamic> listItem) {
    return Cashflow(
        id: listItem['id'],
        personName: listItem['personName'],
        type: listItem['type'],
        value: listItem['value'],
        date: listItem['date'],
        note: listItem['note'],
        paid: listItem['paid'],
        paidDate: listItem['paidDate'],
    );
  }

  String getFormattedDataAndNote(){
    String formattedDate = Jiffy(date).format("dd MMM yyyy");
    if(note!.isEmpty){
      return formattedDate;
    } else {
      return '$formattedDate\n$note';
    }
  }

  String getFormattedNoteDataAndPaidData(){
    String formattedCreationDate = Jiffy(date).format("dd MMM yyyy");
    String formattedPaidDate = Jiffy(date).format("dd MMM yyyy");
    if(note!.isEmpty){
      return 'Created in: $formattedCreationDate\nPaid in: $formattedPaidDate';
    } else {
      return 'Created in: $formattedCreationDate\nPaid in: $formattedPaidDate\n$note';
    }
  }

}