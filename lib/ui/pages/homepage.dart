import 'package:flutter/material.dart';
import 'package:trading_app_demo/ui/widgets/graph_widget.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/infobar_widget.dart';

///Main page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(),
              SizedBox(
                height: 50,
              ),
              InfoBarWidget(),
              SizedBox(
                height: 50,
              ),
              GraphWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
