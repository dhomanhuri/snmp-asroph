// ignore_for_file: file_names

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dart_snmp/dart_snmp.dart';
import 'package:snmp/globals.dart' as globals;
// import 'dart:convert';
import 'dart:core';

import 'package:snmp/page/networkinfo/body/charttest.dart';
import 'package:snmp/page/networkinfo/body/charttest4.dart';
import 'package:snmp/page/networkinfo/body/charttestOut.dart';
import 'package:snmp/page/networkinfo/body/charttestOut3.dart';

import 'charttest3.dart';
import 'charttestOut4.dart';
import 'charttest2.dart';
import 'charttestOut2.dart';
import 'charttest1.dart';
import 'charttestOut1.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String ether1in = "0 Kb",
      ether1out = "0 Kb",
      ether2in = "0 Kb",
      ether2out = "0 Kb",
      ether3in = "0 Kb",
      ether3out = "0 Kb",
      ether4in = "0 Kb",
      ether4out = "0 Kb",
      ether5in = "0 Kb",
      ether5out = "0 Kb";
  List<String> interfaces = [];
  String data = 'data';
  @override
  void initState() {
    super.initState();
    // _getInterface();
    // etherfunc(3);
    // Timer.periodic(const Duration(seconds: 5), (timer) {
    //   //   // print(DateTime.now());
    //   //   bytesin1();
    //   //   bytesout1();
    //   //   bytesin2();
    //   //   bytesout2();
    //   //   bytesin3();
    //   //   bytesout3();
    //   //   bytesin4();
    //   //   bytesout4();
    //   bytesin5();
    //   bytesout5();
    // });
  }

  // Future<void> _getInterface() async {
  //   int i = 6;
  //   do {
  //     i++;
  //     interfaces.add(data);
  //     data = etherfunc(i).toString();
  //     print(data);
  //     // print(length(data));
  //   } while (data != 'done');
  // }

  // Future<String> etherfunc(int i) async {
  //   String devicename = '';
  //   List<String> listname = [];
  //   var target = InternetAddress(globals.ip);
  //   var session = await Snmp.createSession(target);
  //   var oid = Oid.fromString('1.3.6.1.2.1.2.2.1.2.' + i.toString()); // sysDesc
  //   var message = await session.get(oid);
  //   // print(message.pdu.varbinds[0]);
  //   devicename = message.pdu.varbinds[0].toString();
  //   listname = devicename.split(':');
  //   int devnum = listname[1].length;
  //   // print('data : ' + devnum.toString());
  //   if (devnum < 10) {
  //     // print(listname[1]);
  //     return listname[1];
  //   } else {
  //     // print('done');
  //     return 'done';
  //   }
  // }

  Future<String> bytesin5() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.6.5'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether5in = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    // print(devicename);
    return devicename;
  }

  Future<String> bytesout5() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.10.5'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether5out = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    return listname[1];
  }

  Future<String> bytesin4() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.6.4'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether4in = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    // print(devicename);
    return devicename;
  }

  Future<String> bytesout4() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.10.4'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether4out = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    return listname[1];
  }

  Future<String> bytesin3() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.6.3'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether3in = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    // print(devicename);
    return devicename;
  }

  Future<String> bytesout3() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.10.3'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether3out = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    return listname[1];
  }

  Future<String> bytesin2() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.6.2'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether2in = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    // print(devicename);
    return devicename;
  }

  Future<String> bytesout2() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.10.2'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether2out = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    return listname[1];
  }

  Future<String> bytesin1() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.6.1'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether1in = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    // print(devicename);
    return devicename;
  }

  Future<String> bytesout1() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.10.1'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    setState(() {
      ether1out = (int.parse(listname[1]) / 1000).toString() + 'kB';
    });
    return listname[1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.white])),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            const Center(
              child: Text(
                'Network Info',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 22),
            const Text(
              'Interfaces List : ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable(
                columns: const [
                  DataColumn(
                      label: Text('Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('kBin/kBout',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                ],
                rows: [
                  DataRow(cells: [
                    // DataCell(Text('1')),
                    const DataCell(Text('Ether1')),
                    DataCell(Text(
                        ether1in.toString() + ' / ' + ether1out.toString())),
                  ]),
                  DataRow(cells: [
                    // DataCell(Text('2')),
                    const DataCell(Text('Ether2')),
                    DataCell(Text(
                        ether2in.toString() + ' / ' + ether2out.toString())),
                  ]),
                  DataRow(cells: [
                    // DataCell(Text('3')),
                    const DataCell(Text('Ether3')),
                    DataCell(Text(
                        ether3in.toString() + ' / ' + ether3out.toString())),
                  ]),
                  DataRow(cells: [
                    // DataCell(Text('4')),
                    const DataCell(Text('Ether4')),
                    DataCell(Text(
                        ether4in.toString() + ' / ' + ether4out.toString())),
                  ]),
                  DataRow(cells: [
                    // DataCell(Text('5')),
                    const DataCell(Text('Ether5')),
                    DataCell(Text(
                        ether5in.toString() + ' / ' + ether5out.toString())),
                  ]),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Text(
              'Traffict Graph :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 5 In')),
            const ChartTest(),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 5 Out')),
            const ChartTestOut(),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 4 In')),
            const ChartTest4(),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 4 Out')),
            const ChartTestOut4(),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 3 In')),
            const ChartTest3(),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 3 Out')),
            const ChartTestOut3(),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 2 In')),
            const ChartTest2(),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 2 Out')),
            const ChartTestOut2(),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 1 In')),
            const ChartTest1(),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            const Center(child: Text('Ether 1 Out')),
            const ChartTestOut1(),
            Center(
              child: SizedBox(
                height: 70,
                width: 320,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Y Axis : MegaBytes diterima/terkirim'),
                      Text('X Axis : Data ke - n'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
