import 'package:flutter/material.dart';
import 'package:snmp/page/networkinfo/body/Body.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class NetworkInfo extends StatelessWidget {
  const NetworkInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('network info'),
      // ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
