import 'dart:ui';

import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/data_provider.dart';
import 'homepage.dart';

///Class for splash page
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AfterInitMixin<SplashPage> {
  @override
  void didInitState() {
    var dataProvider = Provider.of<DataProvider>(context);
    dataProvider.getDataModelFromEndPoint();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0x7fffffff),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Color(0x1e150c00),
                offset: Offset(8, 24),
                blurRadius: 48,
                spreadRadius: 0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/diamond.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "FinFree",
              style: TextStyle(
                fontFamily: 'FedraSansStd',
                color: Color(0xff150c00),
                fontSize: 40,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
