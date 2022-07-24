import 'package:flutter/material.dart';
import 'package:snmp/page/serverinfo/body/body.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class ServerInfo extends StatelessWidget {
  const ServerInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: Text('appBar'),
      // ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
