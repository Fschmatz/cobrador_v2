import 'package:animations/animations.dart';
import 'package:cobrador_v2/pages/cashflow_list.dart';
import 'package:flutter/material.dart';
import 'configs/settings.dart';
import 'history.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTabIndex = 0;

  final List<Widget> _tabs = [
    CashflowList(
    key: UniqueKey(),
    type: "loan",
  ),
    CashflowList(
      key: UniqueKey(),
      type: "debt",
    ),
    History(
      key: UniqueKey(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Cobrador'),
              pinned: false,
              floating: true,
              snap: true,
              actions: [
                IconButton(
                    tooltip: "Settings",
                    icon: const Icon(
                      Icons.settings_outlined,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const Settings(),
                          ));
                    }),
              ],
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
            icon: Icon(Icons.arrow_upward_outlined),
            selectedIcon: Icon(
              Icons.arrow_upward,
            ),
            label: 'Loans',
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_downward_outlined),
            selectedIcon: Icon(
              Icons.arrow_downward,
            ),
            label: 'Debts',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(
              Icons.history,
            ),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
