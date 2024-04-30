import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphExample extends StatefulWidget {
  const GraphExample({super.key});

  @override
  State<GraphExample> createState() => _GraphExampleState();
}

class _GraphExampleState extends State<GraphExample> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(5, 1400, Colors.deepOrange.shade400),
      ChartData(6, 1400, Colors.deepOrange.shade400),
      ChartData(7, 2000, Colors.deepOrange.shade200),
      ChartData(8, 3000, Colors.deepOrange.shade200),
      ChartData(10, 3800, Colors.lightBlue.shade200),
      ChartData(11, 3800, Colors.lightBlue.shade200),
      ChartData(12, 3800, Colors.lightBlue.shade200),
      ChartData(13, 3800, Colors.lightBlue.shade200),
      ChartData(14, 3800, Colors.lightBlue.shade200),
      ChartData(15, 2000, Colors.yellow.shade300),
      ChartData(16, 2000, Colors.yellow.shade300),
    ];
    return Scaffold(
      body: Center(
        child: Container(
          child: SfCartesianChart(
            series: <CartesianSeries<ChartData, int>>[
              // Renders column chart
              ColumnSeries<ChartData, int>(
                // markerSettings: const MarkerSettings(isVisible: ),
                width: 0.6,
                borderRadius: BorderRadius.circular(6),
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointColorMapper: (ChartData data, _) => data.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.color,
  );
  final int x;
  final double y;
  final Color color;
}
