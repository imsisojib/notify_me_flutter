import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notify_me_app/models/notification.dart';
import 'package:http/http.dart' as http;

class NotificationRepository{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<bool> sendNotification(NotificationInfo notification) async{
    var token = await _firebaseMessaging.getToken();
    if(token==null) return false;

    notification.to = token;

    var url = Uri.parse("https://fcm.googleapis.com/fcm/send");
    var response = await http.post(url,body: json.encode(notification.toJson()),headers: headers);
    int x = 1;

    return true;
  }

}