import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Base provider class with change notifier
///and reassemble handler for hot reload
class BaseProvider extends ChangeNotifier implements ReassembleHandler {
  @override
  void reassemble() {}
}
