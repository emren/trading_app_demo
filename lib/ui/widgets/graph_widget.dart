import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/data_provider.dart';

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
      color: Colors.red,
      child: LineChart(
        LineChartData(
          lineBarsData: [data],
        ),
      ),
    );
  }
}
