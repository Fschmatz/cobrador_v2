import 'dart:async';
import 'package:cobrador_v2/classes/cashflow.dart';
import 'package:flutter/material.dart';

class HistoryTile extends StatefulWidget {
  @override
  _HistoryTileState createState() => _HistoryTileState();

  Cashflow cashflow;

  HistoryTile({
    Key? key,
    required this.cashflow,
  }) : super(key: key);
}

class _HistoryTileState extends State<HistoryTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
       (widget.cashflow.type.compareTo('loan').isEven)
          ? Icons.arrow_upward_outlined
          : Icons.arrow_downward_outlined,
      size: 20,),
      minLeadingWidth: 20,
      title: Text(widget.cashflow.personName),
      trailing: Text('\$ ${widget.cashflow.value.toStringAsFixed(2)}'),
      subtitle: Text(widget.cashflow.getFormattedNoteDataAndPaidData(),)
    );
  }
}
