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
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(0, '1D', dataProvider.dataModel.the1G),
              CustomButton(1, '1W', dataProvider.dataModel.the1H),
              CustomButton(2, '1M', dataProvider.dataModel.the1A),
              CustomButton(3, '3M', dataProvider.dataModel.the3A),
              CustomButton(4, '1Y', dataProvider.dataModel.the1Y),
              CustomButton(5, '5Y', dataProvider.dataModel.the5Y),
            ],
          ),
        ),
      ],
    );
  }

  Widget CustomButton(int index, String text, var list) {
    var dataProvider = Provider.of<DataProvider>(context);
    return GestureDetector(
      onTap: () {
        dataProvider.setTimeFrameMenuSelection(index);
        setState(() {
          _data = list;
        });
      },
      child: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: dataProvider.timeFrameMenuSelection == index
              ? Colors.green
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                color: dataProvider.timeFrameMenuSelection == index
                    ? Colors.white
                    : Colors.black,
              )),
        ),
      ),
    );
  }
}
