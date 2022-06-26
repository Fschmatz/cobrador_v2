import 'package:animations/animations.dart';
import 'package:cobrador_v2/pages/task_list.dart';
import 'package:flutter/material.dart';
import 'configs/settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTabIndex = 0;

  List<Widget> _tabs = [
    TaskList(
    key: UniqueKey(),
    state: 0,
    currentIdTodo: 0,
  ),
    TaskList(
      key: UniqueKey(),
      state: 1,
      currentIdTodo: 0,
    ),
    TaskList(
      key: UniqueKey(),
      state: 2,
      currentIdTodo: 0,
    ),];



  @override
  void initState() {
    super.initState();
    appStartFunctions();
  }

  void appStartFunctions() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text('OI'),
              pinned: false,
              floating: true,
              snap: true,
            ),
          ];
        },
        body: PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) =>
              FadeThroughTransition(
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: _tabs[_currentTabIndex]             ,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTabIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            selectedIcon: Icon(
              Icons.list,
            ),
            label: 'Todo',
          ),
          NavigationDestination(
            icon: Icon(Icons.construction_outlined),
            selectedIcon: Icon(
              Icons.construction,
            ),
            label: 'Doing',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            selectedIcon: Icon(
              Icons.checklist,
            ),
            label: 'Done',
          ),
        ],
      ),
    );
  }
}
