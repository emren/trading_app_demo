import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/data_provider.dart';

///Widget for the app bar
class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
            size: 30.0,
          ),
        ),
        Text(
          dataProvider.dataModel.symbol,
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 30,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            letterSpacing: 0,
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
