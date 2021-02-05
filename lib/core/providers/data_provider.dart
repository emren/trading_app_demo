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
  String getDataModelSymbol() {
    return dataModel.symbol;
  }

  ///Getter method for the last close price of the stock
  String getLastClosePrice() {
    return dataModel.the1G.last.close.toString();
  }

  ///Calculator for percentage rise/fall of stock
  String getPercentage() {
    var lst = dataModel.the1G.length;
    double lastClose = dataModel.the1G[lst - 2].close;
    double previousClose = dataModel.the1G[lst - 3].close;
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




}
