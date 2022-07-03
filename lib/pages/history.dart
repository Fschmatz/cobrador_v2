import 'package:cobrador_v2/widgets/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../classes/cashflow.dart';
import '../db/cashflow_dao.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  RxList cashflowList = [].obs;
  RxBool loading = true.obs;

  @override
  void initState() {
    getHistory();
    super.initState();
  }

  Future<void> getHistory() async {
    final db = CashflowDao.instance;
    var resp = await db.queryAllPaid();
    cashflowList.value = resp;
    loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => (loading.value)
          ? const Center(child: SizedBox.shrink())
          : (cashflowList.isEmpty)
              ? const Center(
                  child: Text(
                  "Nothing in here...\nGood!!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
              : ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                      ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cashflowList.length,
                        itemBuilder: (context, index) {
                          Cashflow cashflow =
                              Cashflow(personName: '', type: '', value: 0);

                          return HistoryTile(
                            cashflow: cashflow.toCashflow(cashflowList[index]),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ]),
    ));
  }
}
