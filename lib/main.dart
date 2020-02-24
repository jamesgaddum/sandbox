import 'package:flutter/material.dart';
import 'package:sandbox/notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandbox',
      home: Notifications(),
    );
  }
}
