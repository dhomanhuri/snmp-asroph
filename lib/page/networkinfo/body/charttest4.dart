import 'dart:io';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'package:snmp/globals.dart' as globals;
import 'package:dart_snmp/dart_snmp.dart';

class ChartTest4 extends StatefulWidget {
  const ChartTest4({Key key}) : super(key: key);

  @override
  State<ChartTest4> createState() => _ChartTest4State();
}

class _ChartTest4State extends State<ChartTest4> {
  List<LiveData> _chartData;
  TooltipBehavior _tooltipBehavior;
  ChartSeriesController _chartSeriesController;
  int value = 0;
  @override
  void initState() {
    _chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SfCartesianChart(
        // title: ChartTitle(text: 'coba'),
        legend: Legend(
          isVisible: false,
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries<LiveData, int>>[
          LineSeries<LiveData, int>(
              onRendererCreated: (ChartSeriesController controller) {
                _chartSeriesController = controller;
              },
              name: 'Ether 5 In',
              dataSource: _chartData,
              xValueMapper: (LiveData sales, _) => sales.time,
              yValueMapper: (LiveData sales, _) => sales.speed,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true),
        ],
        primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        // primaryYAxis: NumericAxis(numberFormat: NumberFormat.simpleCurrency(decimalDigit:0)),
      ),
    );
  }

  Future<int> bytesin5() async {
    String devicename = '';
    List<String> listname = [];
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.6.5'); // sysDesc
    var message = await session.get(oid);
    // print(message.pdu.varbinds[0]);
    devicename = message.pdu.varbinds[0].toString();
    listname = devicename.split(':');
    // setState(() {
    //   ether5in = (int.parse(listname[1]) / 1000).toString() + 'kB';
    // });
    // print(devicename);
    value = int.parse(listname[1]);
    return int.parse(listname[1]);
  }

  int time = 21;
  void updateDataSource(Timer timer) {
    // int value = bytesin5() ;
    bytesin5();
    // print('object' + value.toString());
    _chartData.add(LiveData(time++, value / 1000000));
    _chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
      addedDataIndex: _chartData.length - 1,
      removedDataIndex: 0,
    );
  }

  List<LiveData> getChartData() {
    final List<LiveData> chartData = [
      LiveData(0, 0),
      LiveData(1, 0),
      LiveData(2, 0),
      LiveData(3, 0),
      LiveData(4, 0),
      LiveData(5, 0),
      LiveData(6, 0),
      LiveData(7, 0),
      LiveData(8, 0),
      LiveData(9, 0),
      LiveData(10, 0),
      LiveData(11, 0),
      LiveData(12, 0),
      LiveData(13, 0),
      LiveData(14, 0),
      LiveData(15, 0),
      LiveData(16, 0),
      LiveData(17, 0),
      LiveData(18, 0)
    ];
    return chartData;
  }
}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final double speed;
}
