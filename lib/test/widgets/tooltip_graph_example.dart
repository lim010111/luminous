import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TooltipExample extends StatefulWidget {
  const TooltipExample({super.key});

  @override
  State<TooltipExample> createState() => _TooltipExampleState();
}

class _TooltipExampleState extends State<TooltipExample> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
      enable: true,
      builder: (BuildContext context, TrackballDetails trackballDetails) {
        return Container(
          height: 50,
          width: 150,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 8, 22, 0.75),
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          child: Row(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 11, left: 7),
                  height: 40,
                  width: 100,
                  child: Text(
                    '${trackballDetails.point!.x.toString()} : \$${trackballDetails.point!.y.toString()}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(0, 1),
      ChartData(5, 1),
      ChartData(8, 1),
      ChartData(13, 1),
      ChartData(16, 1),
      ChartData(22, 3),
    ];
    return Scaffold(
      body: Center(
        child: Container(
          child: SfCartesianChart(
            primaryXAxis: const NumericAxis(),
            trackballBehavior: _trackballBehavior,
            series: <CartesianSeries<ChartData, int>>[
              SplineSeries<ChartData, int>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y)
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}
