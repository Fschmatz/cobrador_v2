import 'package:cobrador_v2/pages/cashflow/new_cashflow.dart';
import 'package:cobrador_v2/widgets/cashflow_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../classes/cashflow.dart';
import '../db/cashflow_dao.dart';

class CashflowList extends StatefulWidget {
  String type;

  CashflowList({Key? key, required this.type}) : super(key: key);

  @override
  _CashflowListState createState() => _CashflowListState();
}

class _CashflowListState extends State<CashflowList>
    with TickerProviderStateMixin<CashflowList> {
  List<Map<String, dynamic>> cashflowList = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getCashflowList();
  }

  Future<void> getCashflowList() async {
    final db = CashflowDao.instance;
    var resp = await db.queryAllRows();
    setState(() {
      cashflowList = resp;
      loading = false;
    });
  }

  Cashflow create(Map<String, dynamic> listItem) {
    Cashflow c = Cashflow(personName: '', type: '', value: 0);
    return c.toCashflow(listItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (loading)
          ? const Center(child: SizedBox.shrink())
          : cashflowList.isEmpty
              ? const Center(
                  child: Text(
                  "Nothing in here...\nGood!!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
              : ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                      ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cashflowList.length,
                        itemBuilder: (context, index) {
                          Cashflow c =
                              Cashflow(personName: '', type: '', value: 0);

                          return CashflowCard(
                              cashflow: c.toCashflow(cashflowList[index]),
                              refreshHome: getCashflowList);
                        },
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ]),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => NewCashflow(
                  refreshHome: getCashflowList,
                  edit: false,
                ),
              ));
        },
        child: Icon(
          Icons.add_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
