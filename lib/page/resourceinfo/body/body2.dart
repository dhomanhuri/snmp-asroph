import 'dart:io';

import 'package:dart_snmp/dart_snmp.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'package:snmp/globals.dart' as globals;

class Body2 extends StatefulWidget {
  const Body2({Key key}) : super(key: key);

  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  // late List<ResourceLoad> _chartData;
  List<ResourceLoadmem> _chartDatamem;
  TooltipBehavior _tooltipBehavior;
  int _usedMem = 0, _totalMem = 0;
  String uptime = '';
  int cpuload = 0;
  @override
  void initState() {
    // _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);

    Timer.periodic(const Duration(seconds: 5), updateDataSource);
    totalMem();
    usedMem();

    getcpuusage();
    super.initState();
    // getcpuusage();
  }

  int time = 21;
  void updateDataSource(Timer timer) {
    // int value = bytesin5() ;
    bytesin5();
    // testGet();
    // print('object' + uptime.toString());
  }

  Future<int> bytesin5() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.1.3.0'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    // setState(() {
    //   ether5in = (int.parse(listname[1]) / 1000).toString() + 'kB';
    // });
    setState(() {
      uptime = listname[1] + ':' + listname[2] + ':' + listname[3];
    });
    return int.parse(listname[1]);
  }

  // String? cpuusage;
  Future<String> getcpuusage() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.4.1.14988.1.1.3.14.0'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    cpuload = int.parse(listname[1]);
    // print('gataa' + cpuload.toString());
    return devicename;
  }

  Future<String> usedMem() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.25.2.3.1.6.65536'); // used mmory
    // var oid = Oid.fromString('1.3.6.1.2.1.25.2.3.1.5.65536'); // total mmory
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    // print('deviceTest' + devicename);
    // cpuload = int.parse(listname[1]);
    // print('gataa' + cpuload.toString());
    _usedMem = int.parse(listname[1]);
    _chartDatamem = getChartDatamem(_usedMem, _totalMem);
    return devicename;
  }

  Future<String> totalMem() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    // var oid = Oid.fromString('1.3.6.1.2.1.25.2.3.1.6.65536'); // used mmory
    var oid = Oid.fromString('1.3.6.1.2.1.25.2.3.1.5.65536'); // total mmory
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    // print('deviceTest' + devicename);
    _totalMem = int.parse(listname[1]);
    // print('gataa' + cpuload.toString());
    return devicename;
  }

  @override
  Widget build(BuildContext context) {
    // TooltipBehavior tooltipBehavior;
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
          children: [
            const SizedBox(
              height: 20,
            ),
            // Card(
            //   child: SfCircularChart(
            //     title: ChartTitle(text: 'Cpu Load'),
            //     legend: Legend(
            //       isVisible: true,
            //       overflowMode: LegendItemOverflowMode.wrap,
            //     ),
            //     tooltipBehavior: _tooltipBehavior,
            //     // tooltipBehavior = _tooltipBehavior,
            //     series: <CircularSeries>[
            //       PieSeries<ResourceLoad, String>(
            //         dataSource: _chartData,
            //         xValueMapper: (ResourceLoad data, _) => data.nameRes,
            //         yValueMapper: (ResourceLoad data, _) => data.cpuavailable,
            //         dataLabelSettings: DataLabelSettings(isVisible: true),
            //         enableTooltip: true,
            //       )
            //       // DataLabelSettings:
            //     ],
            //   ),
            // ),
            Card(
              // child: SfCircularChart(
              //   title: ChartTitle(text: 'Failure Chart'),
              //   legend: Legend(
              //       isVisible: true,
              //       overflowMode: LegendItemOverflowMode.wrap),
              //   tooltipBehavior: _tooltipBehavior,
              //   series: <CircularSeries>[
              //     PieSeries<ResourceLoadmem, String>(
              //       dataSource: _chartDatamem,
              //       xValueMapper: (ResourceLoadmem data, _) => data.nameRes,
              //       yValueMapper: (ResourceLoadmem data, _) =>
              //           data.memavailable,
              //       dataLabelSettings: DataLabelSettings(isVisible: true),
              //       enableTooltip: true,
              //     ),
              //   ],
              // ),

              child: SfCircularChart(
                title: ChartTitle(text: 'Memory Load'),
                legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                tooltipBehavior: _tooltipBehavior,
                // tooltipBehavior = _tooltipBehavior,
                series: <CircularSeries>[
                  PieSeries<ResourceLoadmem, String>(
                    dataSource: _chartDatamem,
                    xValueMapper: (ResourceLoadmem data, _) => data.nameRes,
                    yValueMapper: (ResourceLoadmem data, _) =>
                        data.memavailable,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true,
                  )
                  // DataLabelSettings:
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Card(child: Center(child: Text('Up Time : ' + uptime))),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Card(
                  child: Center(
                      child: Text('CPU Frequency : ' + cpuload.toString()))),
            )
          ],
        ),
      ),
    );
  }

  // List<ResourceLoad> getChartData() {
  //   final List<ResourceLoad> chartData = [
  //     ResourceLoad('Load', cpuload),
  //     ResourceLoad('Available', 60)
  //   ];
  //   return chartData;
  // }

  List<ResourceLoadmem> getChartDatamem(int a, int b) {
    final List<ResourceLoadmem> chartData = [
      ResourceLoadmem('Load', a),
      ResourceLoadmem('Available', b - a)
    ];
    return chartData;
  }
}

// class ResourceLoad {
//   ResourceLoad(this.nameRes, this.cpuavailable);
//   final String nameRes;
//   final int cpuavailable;
// }

class ResourceLoadmem {
  ResourceLoadmem(this.nameRes, this.memavailable);
  final String nameRes;
  final int memavailable;
}
