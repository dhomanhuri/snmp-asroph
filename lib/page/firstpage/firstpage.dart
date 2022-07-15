import 'package:flutter/material.dart';
import 'package:snmp/page/firstpage/body/body.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('data'),
      // ),
      body: Body(),
    );
  }
}
