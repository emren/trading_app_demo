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
}