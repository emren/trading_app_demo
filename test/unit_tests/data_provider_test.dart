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
  });
}
