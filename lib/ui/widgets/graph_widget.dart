import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/data_provider.dart';

///Widget for the graph tool
class GraphWidget extends StatefulWidget {
  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    var data = dataProvider.getOneDayPriceEntryList();
    return Container(
      height: 400,
      width: 400,
      color: Colors.white30,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 100,
          minY: 5,
          maxY: 8,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineBarsData: [data],
        ),
      ),
    );
  }
}
