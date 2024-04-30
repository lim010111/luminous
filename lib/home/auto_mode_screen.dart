import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luminous/formulas/temp_to_rgb.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AutoModeScreen extends StatefulWidget {
  const AutoModeScreen({super.key});

  @override
  State<AutoModeScreen> createState() => _AutoModeScreenState();
}

class _AutoModeScreenState extends State<AutoModeScreen> {
  late SelectionBehavior _selectionBehavior;

  @override
  void initState() {
    super.initState();
    _selectionBehavior = SelectionBehavior(
      enable: true,
      unselectedOpacity: 0.3,
    );
  }

  @override
  Widget build(BuildContext context) {
    double brightnessValue = 0;
    int selectedIndex = DateTime.now().hour;
    final List<ChartData> chartData = [
      ChartData(0, 1800, colorTempToRGB(2200, 255)),
      ChartData(1, 1800, colorTempToRGB(2200, 255)),
      ChartData(2, 1800, colorTempToRGB(2200, 255)),
      ChartData(3, 1800, colorTempToRGB(2200, 255)),
      ChartData(4, 1800, colorTempToRGB(2200, 255)),
      ChartData(5, 2800, colorTempToRGB(3000, 255)),
      ChartData(6, 2800, colorTempToRGB(3000, 255)),
      ChartData(7, 4800, colorTempToRGB(100000, 255)),
      ChartData(8, 4800, colorTempToRGB(100000, 255)),
      ChartData(9, 4800, colorTempToRGB(100000, 255)),
      ChartData(10, 4800, colorTempToRGB(100000, 255)),
      ChartData(11, 4800, colorTempToRGB(100000, 255)),
      ChartData(12, 4800, colorTempToRGB(100000, 255)),
      ChartData(13, 4800, colorTempToRGB(100000, 255)),
      ChartData(14, 4800, colorTempToRGB(100000, 255)),
      ChartData(15, 3600, colorTempToRGB(3600, 255)),
      ChartData(16, 3600, colorTempToRGB(3600, 255)),
      ChartData(17, 2800, colorTempToRGB(3000, 255)),
      ChartData(18, 2800, colorTempToRGB(3000, 255)),
      ChartData(19, 2800, colorTempToRGB(3000, 255)),
      ChartData(20, 2300, colorTempToRGB(3000, 255)),
      ChartData(21, 2300, colorTempToRGB(2200, 255)),
      ChartData(22, 2300, colorTempToRGB(2200, 255)),
      ChartData(23, 2300, colorTempToRGB(2200, 255)),
      ChartData(24, 1800, colorTempToRGB(2200, 255)),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.07,
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Morning'),
              Text('Day'),
              Text('Evening'),
              Text('Night'),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 3,
                  offset: Offset(0, 1),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color(0x4C000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.2,
            child: SfCartesianChart(
              primaryXAxis: const NumericAxis(
                isVisible: false,
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: const NumericAxis(
                isVisible: false,
                majorGridLines: MajorGridLines(width: 0),
              ),
              plotAreaBorderColor: Colors.transparent,
              series: <CartesianSeries<ChartData, double>>[
                ColumnSeries<ChartData, double>(
                  // ignore: prefer_const_literals_to_create_immutables
                  initialSelectedDataIndexes: <int>[selectedIndex],
                  dataSource: chartData,
                  selectionBehavior: _selectionBehavior,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  pointColorMapper: (ChartData data, _) => data.color,
                  borderRadius: BorderRadius.circular(3),
                  width: .65,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.color,
    // this.isSelected,
  );
  final double? x;
  final double? y;
  final Color? color;
  // final bool isSelected;
}
