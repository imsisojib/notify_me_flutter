import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class NotificationProvider extends ChangeNotifier{
  RemoteNotification _remoteNotification = new RemoteNotification();

  get remoteNotification => _remoteNotification;

  set setRemoteNotification(RemoteNotification remoteNotification){
    this._remoteNotification = remoteNotification;
    notifyListeners();
  }

}