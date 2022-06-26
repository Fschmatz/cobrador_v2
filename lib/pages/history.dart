import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class History extends StatefulWidget {

  History({Key? key})
      : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History>
    with TickerProviderStateMixin<History> {

  List<Map<String, dynamic>> list = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (loading)
          ? const Center(child: SizedBox.shrink())
          :/* list.isEmpty
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
              itemCount: 10,//list.length
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
                  child: Card(
                    child: Center(child: Text('\nHahhhahahah What a story Mark!\n')),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ]),

    );
  }
}
