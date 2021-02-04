import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/data_provider.dart';

///Widget for the app bar
class InfoBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left:10.0),
          child: Text(
            dataProvider.getDataModelSymbol(),
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 30,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          ),
        ),
        Text('₺',
            style: TextStyle(
              fontFamily: 'Roboto',
            )),
        Padding(
          padding: EdgeInsets.only(left:10.0),
          child: Text(
            dataProvider.getLastClosePrice() ,
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 30,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.add,
            color: Colors.green,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
