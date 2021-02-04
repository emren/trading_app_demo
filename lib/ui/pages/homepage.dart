import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/data_provider.dart';
import '../widgets/appbar_widget.dart';

///Main page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterInitMixin<HomePage> {
  @override
  void didInitState() {
    var dataProvider = Provider.of<DataProvider>(context);
    dataProvider.getDataModelFromEndPoint();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              AppBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
