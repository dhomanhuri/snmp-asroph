import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fl_chart/fl_chart.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const Center(
            child: Text(
              'History',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const Text(
            'Traffict List :',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            width: double.infinity,
            height: 200,
            // color: Colors.pink,
            child: LineChart(
              LineChartData(
                maxX: 8,
                maxY: 8,
                minX: 0,
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 0),
                      FlSpot(1, 5),
                      FlSpot(2, 6),
                      FlSpot(3, 2),
                      FlSpot(4, 8),
                      FlSpot(5, 3),
                      FlSpot(6, 4),
                      FlSpot(7, 2),
                      FlSpot(8, 2),
                    ],
                    isCurved: true,
                    colors: [Colors.black, Colors.grey],
                    barWidth: 5,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          const Text(
            'Bandwidht Usage : ',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            width: double.infinity,
            height: 200,
            // color: Colors.pink,
            child: LineChart(
              LineChartData(
                maxX: 8,
                maxY: 8,
                minX: 0,
                minY: 0,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 0),
                      FlSpot(1, 5),
                      FlSpot(2, 6),
                      FlSpot(3, 2),
                      FlSpot(4, 8),
                      FlSpot(5, 3),
                      FlSpot(6, 4),
                      FlSpot(7, 2),
                      FlSpot(8, 2),
                    ],
                    isCurved: true,
                    colors: [Colors.black, Colors.grey],
                    barWidth: 5,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
