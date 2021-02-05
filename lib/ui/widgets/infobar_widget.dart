import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/data_provider.dart';

///Widget for the info bar
class InfoBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            dataProvider.getDataModelSymbol(),
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 40,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Text(
                dataProvider.getLastClosePrice(),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
              Text(
                ' ₺',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Icon(
                Icons.arrow_upward,
                color: Colors.green,
                size: 30.0,
              ),
              Text(
                dataProvider.getPercentage(dataProvider.timeFrameMenuSelection),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
              Text(
                ' %',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
