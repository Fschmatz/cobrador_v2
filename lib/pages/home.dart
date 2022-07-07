import 'package:animations/animations.dart';
import 'package:cobrador_v2/controller/bottom_navigation_controller.dart';
import 'package:cobrador_v2/pages/cashflow_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/settings.dart';
import 'history.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  List<Widget> _tabs = [
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

  void refreshHome() {
    setState(() {
      _tabs = [
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
    });
  }

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
                      Get.to(() => Settings(refreshHome: refreshHome));
                    }),
              ],
            ),
          ];
        },
        body: Obx(
          () => PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) =>
                FadeThroughTransition(
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            child: _tabs[bottomNavigationController.currentIndex.value],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: bottomNavigationController.currentIndex.value,
          onDestinationSelected: (index) {
            bottomNavigationController.changeIndex(index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.upload_outlined),
              selectedIcon: Icon(
                Icons.upload,
              ),
              label: 'Loans',
            ),
            NavigationDestination(
              icon: Icon(Icons.save_alt_outlined),
              selectedIcon: Icon(
                Icons.save_alt_outlined,
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
      ),
    );
  }
}
