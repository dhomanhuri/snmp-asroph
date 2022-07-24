import 'package:flutter/material.dart';
import 'package:snmp/page/networkinfo/body/Body.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class NetworkInfo extends StatelessWidget {
  const NetworkInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('network info'),
      // ),
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
      resizeToAvoidBottomInset: true,
    );
  }
}
