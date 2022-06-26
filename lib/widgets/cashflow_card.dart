import 'dart:async';
import 'package:cobrador_v2/classes/cashflow.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CashflowCard extends StatefulWidget {
  @override
  _CashflowCardState createState() => _CashflowCardState();

  Cashflow cashflow;
  Function() refreshHome;


  CashflowCard(
      {Key? key,
        required this.cashflow,
        required this.refreshHome,       })
      : super(key: key);
}

class _CashflowCardState extends State<CashflowCard> {


  void _delete() async {

  }

  Future<void> _archivePlaylist() async {

  }

  void openBottomMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Wrap(
                children: <Widget>[

                  const Divider(),
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
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.delete_outline_outlined),
                    title: const Text(
                      "Delete",
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {

                    },
                  ),
                ],
              ),
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
          subtitle: Text(widget.cashflow.value.toString()),
        ),
      ),
    );
  }
}
