import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/data_provider.dart';
import 'ui/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
