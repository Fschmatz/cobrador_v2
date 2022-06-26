import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CashflowList extends StatefulWidget {
  String type;
 

  CashflowList({Key? key, required this.type})
      : super(key: key);

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
    //var resp = await dbBug.getAllByState(widget.state);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (loading)
          ? const Center(child: SizedBox.shrink())
          : /*cashflowList.isEmpty
              ? const Center(
                  child: Text(
                  "Nothing in here...\nGood!!!",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
              : */
      ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                      ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 25,//cashflowList.length
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
                            child: Card(
                              child: Center(child: Text('\nHi Mark!\n')),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ]),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => New(),
              ));*/
        },
        child: Icon(
          Icons.add_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
