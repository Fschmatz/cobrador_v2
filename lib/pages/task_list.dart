import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TaskList extends StatefulWidget {
  int state;
  int currentIdTodo;

  TaskList({Key? key, required this.state, required this.currentIdTodo})
      : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList>
    with TickerProviderStateMixin<TaskList> {
  List<Map<String, dynamic>> tasksList = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (loading)
          ? const Center(child: SizedBox.shrink())
          : tasksList.isEmpty
              ? const Center(
                  child: Text(
                  "Nothing in here...\nit's good?",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
              : ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                      ListView.separated(
                        separatorBuilder:
                            (BuildContext context, int index) =>
                                const SizedBox(
                          height: 5,
                        ),
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: tasksList.length,
                        itemBuilder: (context, index) {
                          return Card();
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
                builder: (BuildContext context) => NewTask(),
              ));*/
        },
        child: Icon(
          Icons.add_outlined,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
