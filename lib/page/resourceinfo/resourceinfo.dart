import 'package:flutter/material.dart';
import 'package:snmp/page/resourceinfo/body/body.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

class ResourceInfo extends StatelessWidget {
  const ResourceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Resource Information'),
      // ),
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
