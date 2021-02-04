import 'dart:convert';

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

  ///Method to get one day list of price entry objects
  List<PriceEntry> getOneDayPriceEntryList() {
    var list = dataModel.the1G;
    return list;
  }

  ///Method to get one week list of price entry objects
  List<PriceEntry> getOneWeekPriceEntryList() {
    var list = dataModel.the1H;
    return list;
  }

  ///Method to get one month list of price entry objects
  List<PriceEntry> getOneMonthPriceEntryList() {
    var list = dataModel.the1A;
    return list;
  }

  ///Method to get one year list of price entry objects
  List<PriceEntry> getOneYearPriceEntryList() {
    var list = dataModel.the1Y;
    return list;
  }

  ///Method to get three month list of price entry objects
  List<PriceEntry> getThreeMonthPriceEntryList() {
    var list = dataModel.the3A;
    return list;
  }

  ///Method to get five year list of price entry objects
  List<PriceEntry> getFiveYearPriceEntryList() {
    var list = dataModel.the5Y;
    return list;
  }
}
