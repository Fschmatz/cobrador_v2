import 'dart:async';
import 'package:cobrador_v2/classes/cashflow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cashflow_controller.dart';
import '../pages/cashflow/new_edit_cashflow.dart';

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

  showDialogConfirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Confirm",
          ),
          content: const Text(
            "Delete ?",
          ),
          actions: [
            TextButton(
              child: const Text(
                "Yes",
              ),
              onPressed: () {
                _delete();
                widget.refreshHome();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
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
                    '${widget.cashflow.personName}\n\$ ${widget.cashflow.value.toStringAsFixed(2)}',
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
                    Get.to(() =>
                        NewEditCashflow(
                          refreshHome: widget.refreshHome,
                          cashflow: widget.cashflow,
                          edit: true,
                        ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.delete_outline_outlined),
                  title: const Text(
                    "Delete",
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    showDialogConfirmDelete(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        onTap: openBottomMenu,
        title: Text(widget.cashflow.personName),
        trailing: Text('\$ ${widget.cashflow.value.toStringAsFixed(2)}'),
        subtitle: Text(widget.cashflow.getFormattedDataAndNote()),
      ),
    );
  }
}
