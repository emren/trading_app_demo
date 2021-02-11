import 'dart:convert';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/data_model.dart';
import '../services/data_service.dart';

///Provider for data
class DataProvider extends ChangeNotifier {
  DataModel _dataModel;

  ///Getter for data model
  get dataModel => _dataModel;

  ///Setter for data model
  void setdataModel(DataModel dtm) {
    _dataModel = dtm;
  }

  ///Data Model is taken to state from endpoint
  void getDataModelFromEndPoint() async {
    var service = DataService();
    var response = await service.getData();
    var dataModel = DataModel.fromJson(json.decode(response.data));
    setdataModel(dataModel);
    print(dataModel.symbol);
  }

  ///Getter method for the symbol of the datamodel
  String getDataModelSymbol() => dataModel.symbol;

  ///Getter method for the last close price of the stock
  String getLastClosePrice() => dataModel.the1G.last.close.toString();

  ///Calculator for percentage rise/fall of stock depending on selection
  String getPercentage(int selection) {
    var list;
    switch (selection) {
      case 0:
        {
          list = dataModel.the1G;
        }
        break;
      case 1:
        {
          list = dataModel.the1H;
        }
        break;
      case 2:
        {
          list = dataModel.the1A;
        }
        break;
      case 3:
        {
          list = dataModel.the3A;
        }
        break;
      case 4:
        {
          list = dataModel.the1Y;
        }
        break;
      case 5:
        {
          list = dataModel.the5Y;
        }
        break;
    }

    var lst = list.length;
    double lastClose = list[lst - 1].close;
    double previousClose = list[lst - 2].close;
    var prc = (lastClose - previousClose) / previousClose * 100;
    var percentage = double.parse(prc.toString()).toStringAsFixed(2);
    return percentage;
  }

  ///Method to get list of price entry objects
  LineChartData getPriceEntryList(List<PriceEntry> list) {
    var length = list.length.toDouble();
    var closings = <double>[];
    var spots = <FlSpot>[];
    for (var i = 0; i < length; i++) {
      closings.add(list[i].close);
      spots.add(FlSpot(i.toDouble(), list[i].close));
    }
    var lst = LineChartBarData(
      spots: spots,
      colors: [Colors.green],
      isCurved: true,
      dotData: FlDotData(
        show: false,
      ),
    );
    var data = LineChartData(
      minX: 0,
      maxX: length + 10,
      minY: closings.reduce(min),
      maxY: closings.reduce(max),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      lineBarsData: [lst],
    );
    return data;
  }

  ///Timeframe menu selection
  int _timeFrameMenuSelection = 0;

  ///Getter for timeframe menu selection
  int get timeFrameMenuSelection => _timeFrameMenuSelection;

  ///Setter for timeframe menu selection
  void setTimeFrameMenuSelection(int itemId) {
    _timeFrameMenuSelection = itemId;
    notifyListeners();
  }
}
