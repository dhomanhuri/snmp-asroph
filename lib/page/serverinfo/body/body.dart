import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snmp/globals.dart' as globals;
import 'package:dart_snmp/dart_snmp.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String devicename = '';
  List<String> listname = [];
  @override
  void initState() {
    super.initState();
    devname();
  }

  void devname() async {
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.1.1.0'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    //   setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // double heightabs = double.infinity / 15;
    // int i = heightabs.toInt;
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      // margin: EdgeInsets.symmetric(vertical: 50),
      // decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomCenter,
      //         colors: [Colors.white, Colors.white])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const Center(
            child: Text(
              'System Info',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const Text(
            'Nama : ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          Text(globals.name),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          const Text(
            'Server IP : ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          Text(globals.ip),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          // Text(
          //   'SNMP Ports : ',
          //   style: TextStyle(
          //     fontSize: 16,
          //     color: Colors.black,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // Text('dsfdsf'),
          // Text(
          //   'SNMP Community : ',
          //   style: TextStyle(
          //     fontSize: 16,
          //     color: Colors.black,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // Text('asdasdsa'),
          const Text(
            'Device Name : ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 60,
          ),
          Text(listname[1].toString()),
        ],
      ),
    );
  }
}
