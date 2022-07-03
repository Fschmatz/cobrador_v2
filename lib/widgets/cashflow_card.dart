import 'dart:async';
import 'package:cobrador_v2/classes/cashflow.dart';
import 'package:flutter/material.dart';

import '../controller/cashflow_controller.dart';

class CashflowCard extends StatefulWidget {
  @override
  _CashflowCardState createState() => _CashflowCardState();

  Cashflow cashflow;
  Function() refreshHome;

  CashflowCard({
    Key? key,
    required this.cashflow,
    required this.refreshHome,
  }) : super(key: key);
}

class _CashflowCardState extends State<CashflowCard> {

  void _delete() async {
    deleteCashflow(widget.cashflow.id!);
  }

  void _markPaid() async {
    payCashflow(widget.cashflow);
  }

  void openBottomMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Wrap(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '${widget.cashflow.personName}\n${widget.cashflow.value.toString()}',
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.done_outline_outlined),
                  title: const Text(
                    "Mark as paid",
                  ),
                  onTap: () {
                    _markPaid();
                    widget.refreshHome();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.edit_outlined),
                  title: const Text(
                    "Edit",
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    /*  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => EditPlaylist(
                            playlist: widget.playlist,
                            refreshHome: widget.refreshHome,
                          ),
                        ));*/
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete_outline_outlined),
                  title: const Text(
                    "Delete",
                  ),
                  onTap: () {
                    _delete();
                    widget.refreshHome();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      child: Card(
        child: ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          onTap: openBottomMenu,
          title: Text(widget.cashflow.personName),
          trailing: Text('\$ ${widget.cashflow.value.toStringAsFixed(2)}'),
          subtitle: widget.cashflow.note!.isEmpty
              ? null
              : Text(widget.cashflow.note!),
        ),
      ),
    );
  }
}
