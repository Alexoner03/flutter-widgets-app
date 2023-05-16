import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, required this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value){

          setState(() {
            navDrawerIndex = value;
          });

          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();

        },
        children: [

          Padding(padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10), child: const Text("Menu")),
          ...appMenuItems
              .sublist(0,3)
              .map((e) => NavigationDrawerDestination(icon: Icon(e.icon), label: Text(e.title))),
          const Padding(padding: EdgeInsets.fromLTRB(28, 16, 16, 10), child: Divider()),

          const Padding(padding: EdgeInsets.fromLTRB(28, 10, 16, 10), child: Text("More options")),
          ...appMenuItems
              .sublist(3)
              .map((e) => NavigationDrawerDestination(icon: Icon(e.icon), label: Text(e.title))),
        ]
    );
  }
}
