import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    _firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, alert: true, badge: true));
    
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });
    
    _firebaseMessaging.configure(
      onLaunch: _handleNotification,
      onMessage: _handleNotification,
      onResume: _handleNotification
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Notifications')
      )
    );
  }

  Future<dynamic> _handleNotification (Map<dynamic, dynamic> message) {
    var data = message['data'] ?? message;
    print(message);
    print(data);
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
          height: 30,
          width: 150,
          child: Text('Hello')
        )
      ),
    );
    return data;
  }
}