import 'package:cobrador_v2/pages/cashflow/new_edit_cashflow.dart';
import 'package:cobrador_v2/widgets/cashflow_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../classes/cashflow.dart';
import '../db/cashflow_dao.dart';

class CashflowList extends StatefulWidget {
  String type;

  CashflowList({Key? key, required this.type}) : super(key: key);

  @override
  _CashflowListState createState() => _CashflowListState();
}

class _CashflowListState extends State<CashflowList>{

  RxList cashflowList = [].obs;
  RxBool loading = true.obs;

  @override
  void initState() {
    getCashflowList();
    super.initState();
  }

  Future<void> getCashflowList() async {
    final db = CashflowDao.instance;
    var resp = await db.queryAllByType(widget.type);
    cashflowList.value = resp;
    loading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
        (loading.value)
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
                        ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cashflowList.length,
                          itemBuilder: (context, index) {
                            Cashflow cashflow =
                                Cashflow(personName: '', type: '', value: 0);

                            return CashflowCard(
                                cashflow: cashflow.toCashflow(cashflowList[index]),
                                refreshHome: getCashflowList);
                          },
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ]),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Get.to(() =>
            NewEditCashflow(
             refreshHome: getCashflowList,
              edit: false,
              type: widget.type,
            ),
          );
        },
        child: Icon(
          Icons.add_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
