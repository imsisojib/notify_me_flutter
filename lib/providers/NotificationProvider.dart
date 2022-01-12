import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:notify_me_app/models/notification.dart';
import 'package:notify_me_app/repositories/notification_repository.dart';

class NotificationProvider extends ChangeNotifier{
  Data _remoteNotification = Data();
  bool _isNotificationReceived = false;

  get remoteNotification => _remoteNotification;
  get isNotificationReceived => _isNotificationReceived;

  set setRemoteNotification(Data data){
    this._remoteNotification = data;
    this._isNotificationReceived = true;
    notifyListeners();
  }

  set updateIsNotificationReceived(bool update){
    this._isNotificationReceived = update;
    notifyListeners();
  }

}