import 'dart:io';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:dart_snmp/dart_snmp.dart';
import 'package:snmp/globals.dart' as globals;

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  initState() {
    super.initState();
    getcpuusage();
  }

  String cpuusage;
  Future<String> getcpuusage() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.25.3.3.1.2'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    print(devicename);
    return devicename;
  }

  Map<String, double> dataMap = {
    "Load": 18.47,
    "Available": 17.70,
  };

  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
  ];
  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
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
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const Text(
            'Resource Info',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 35,
          ),
          const Text('CPU Info'),
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  // centerText: "Budget",

                  ringStrokeWidth: 24,
                  animationDuration: const Duration(seconds: 3),
                  chartValuesOptions: const ChartValuesOptions(
                      showChartValues: true,
                      showChartValuesOutside: true,
                      showChartValuesInPercentage: true,
                      showChartValueBackground: false),
                  legendOptions: const LegendOptions(
                      showLegends: true,
                      legendShape: BoxShape.circle,
                      legendTextStyle: TextStyle(fontSize: 15),
                      legendPosition: LegendPosition.right,
                      showLegendsInRow: true),
                  gradientList: gradientList,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 35,
          ),
          const Text('CPU Info'),
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  // centerText: "Budget",

                  ringStrokeWidth: 24,
                  animationDuration: const Duration(seconds: 3),
                  chartValuesOptions: const ChartValuesOptions(
                      showChartValues: true,
                      showChartValuesOutside: true,
                      showChartValuesInPercentage: true,
                      showChartValueBackground: false),
                  legendOptions: const LegendOptions(
                      showLegends: true,
                      legendShape: BoxShape.circle,
                      legendTextStyle: TextStyle(fontSize: 15),
                      legendPosition: LegendPosition.right,
                      showLegendsInRow: true),
                  gradientList: gradientList,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 35,
          ),
          const Text('CPU Info'),
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  // centerText: "Budget",

                  ringStrokeWidth: 24,
                  animationDuration: const Duration(seconds: 3),
                  chartValuesOptions: const ChartValuesOptions(
                      showChartValues: true,
                      showChartValuesOutside: true,
                      showChartValuesInPercentage: true,
                      showChartValueBackground: false),
                  legendOptions: const LegendOptions(
                      showLegends: true,
                      legendShape: BoxShape.circle,
                      legendTextStyle: TextStyle(fontSize: 15),
                      legendPosition: LegendPosition.right,
                      showLegendsInRow: true),
                  gradientList: gradientList,
                  // Body2(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
