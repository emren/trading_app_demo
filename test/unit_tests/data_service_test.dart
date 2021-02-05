import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trading_app_demo/core/services/data_service.dart';
import 'package:trading_app_demo/core/utils/constants.dart';

///Mock class for data service
class MockService extends Mock implements DataService {}

///Tests for data service class
void main() {
  group(
    'Data service tests',
    () {
      TestWidgetsFlutterBinding.ensureInitialized();

      MockService _mockService;

      setUp(
        () {
          _mockService = MockService();
        },
      );

      test(
        'getData - Response data should contain status ',
        () async {
          when(_mockService.getData()).thenAnswer(
            (_) async => Response(data: {"status": "200"}),
          );
          var app = _mockService;
          var response = await app.getData();
          Map<String, String> rsp = response.data;
          expect(rsp.keys.contains('status'), true);
        },
      );

      test(
        'baseUrl - Base url should be Constants.baseUrl',
        () async {
          var app = DataService();
          var url = app.baseUrl;
          expect(Constants.baseUrl, url);
        },
      );

      test(
        'token - Token should be R29vZCBMdWNr',
        () async {
          var app = DataService();
          var str = app.token;
          expect(str, 'R29vZCBMdWNr');
        },
      );
    },
  );
}
