import 'package:flutter/material.dart';
import 'package:snmp/page/resourceinfo/body/body2.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class ResourceInfo extends StatelessWidget {
  const ResourceInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Resource Information'),
      // ),
      body: Body2(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
