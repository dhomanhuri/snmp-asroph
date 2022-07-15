import 'package:flutter/material.dart';
import 'package:snmp/enums.dart';
import 'package:snmp/page/history/body/body.dart';

import '../../components/coustom_bottom_nav_bar.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('history'),
      // ),
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
