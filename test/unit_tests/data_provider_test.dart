import 'package:flutter_test/flutter_test.dart';
import 'package:trading_app_demo/core/models/data_model.dart';
import 'package:trading_app_demo/core/providers/data_provider.dart';

void main() {
  group('Data provider tests', () {
    setUp(() {});

    test('dataModel - Data model should start empty', () {
      var app = DataProvider();
      var value = app.dataModel;
      expect(value, null);
    });

    test('setDataModel - Data model should be set', () {
      var app = DataProvider();
      var dtm = DataModel(symbol: 'GARAN');
      app.setdataModel(dtm);
      var value = app.dataModel.symbol;
      expect(value, 'GARAN');
    });

    test('dataModel - Data model should get instance of it', () {
      var app = DataProvider();
      var dtm = DataModel(symbol: 'GARAN');
      app.setdataModel(dtm);
      app.dataModel;
      expect(app.dataModel.toString(), 'Instance of \'DataModel\'');
    });

    test('timeFrameMenuSelection - Time frame menu selection should start zero',
        () {
      var app = DataProvider();
      var value = app.timeFrameMenuSelection;
      expect(value, 0);
    });

    test(
        'setTimeFrameMenuSelection - '
        'Time frame menu selection model should be set', () {
      var app = DataProvider();
      app.setTimeFrameMenuSelection(4);
      var value = app.timeFrameMenuSelection;
      expect(value, 4);
    });

    test(
        'getPriceEntryList - '
        'LineChartData should return when a list of PriceEntry provided', () {
      var app = DataProvider();
      var list = <PriceEntry>[PriceEntry(close: 1)];
      var value = app.getPriceEntryList(list);
      expect(value.toString(), 'LineChartData');
    });

    test(
        'getPercentage - '
        'Percentage should get when a DataModel '
        'with a list of PriceEntry provided', () {
      var app = DataProvider();
      app.setdataModel(DataModel(the1H: <PriceEntry>[
        PriceEntry(close: 1),
        PriceEntry(close: 1),
        PriceEntry(close: 1)
      ]));
      var value = app.getPercentage(1);
      expect(value.isNotEmpty, true);
    });

    test('getDataModelSymbol - Data model symbol should get', () {
      var app = DataProvider();
      var dtm = DataModel(symbol: 'ISCTR');
      app.setdataModel(dtm);
      var value = app.getDataModelSymbol();
      expect(value, 'ISCTR');
    });

    test('getLastClosePrice - Data model symbol should get', () {
      var app = DataProvider();
      app.setdataModel(DataModel(the1G: <PriceEntry>[
        PriceEntry(close: 5),
      ]));
      var value = app.getLastClosePrice();
      expect(value, 5.0.toString());
    });
  });
}
