import 'package:after_init/after_init.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/data_provider.dart';

///Widget for the graph tool
class GraphWidget extends StatefulWidget {
  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget>
    with AfterInitMixin<GraphWidget> {
  var _data;

  @override
  void didInitState() {
    var dataProvider = Provider.of<DataProvider>(context);
    _data = dataProvider.dataModel.the3A;
  }

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Container(
            height: 200,
            width: 400,
            color: Colors.white30,
            child: LineChart(dataProvider.getPriceEntryList(_data)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton('1D', dataProvider.dataModel.the1G),
            CustomButton('1W', dataProvider.dataModel.the1H),
            CustomButton('1M', dataProvider.dataModel.the1A),
            CustomButton('3M', dataProvider.dataModel.the3A),
            CustomButton('1Y', dataProvider.dataModel.the1Y),
            CustomButton('5Y', dataProvider.dataModel.the5Y),
          ],
        ),
      ],
    );
  }

  Widget CustomButton(String text, var list) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _data = list;
        });
      },
      child: Container(
        width: 60,
        height: 40,
        color: Colors.red,
        child: Center(child: Text(text)),
      ),
    );
  }
}
