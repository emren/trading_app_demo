import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/providers/data_provider.dart';
import 'ui/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}
///My app
class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
}
