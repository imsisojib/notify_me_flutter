import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notify_me_app/providers/firebase_provider.dart';
import 'package:notify_me_app/router/router_helper.dart';
import 'package:notify_me_app/router/routes.dart';
import 'package:notify_me_app/strings/ConstantStrings.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;

//for default notification channel
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "default_channel",
  "NotifyMe Notifications",
  importance: Importance.defaultImportance,
  playSound: false,
);

//for local notification globally
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//for background handling, if any notification appeared and app in background
Future<void> firebaseNotificaionBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //handles background notificaion
  FirebaseMessaging.onBackgroundMessage(firebaseNotificaionBackgroundHandler);
  //handles local notification
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: false,
  );

  //dependency injection initialized
  await di.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> di.sl<FirebaseProvider>()),
  ],child: NotifyMeApp(),));
}

class NotifyMeApp extends StatefulWidget{
  static final navigatorKey = new GlobalKey<NavigatorState>();
  @override
  State<StatefulWidget> createState() {
    return _NotifyMeAppState();
  }

}

class _NotifyMeAppState extends State<NotifyMeApp>{

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:  Routes.HOME_SCREEN,
      onGenerateRoute: RouterHelper.router.generator,
      title: ConstantStrings.APP_NAME,
      debugShowCheckedModeBanner: false,
      navigatorKey: NotifyMeApp.navigatorKey,
    );
  }

}

