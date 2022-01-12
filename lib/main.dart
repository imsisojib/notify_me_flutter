import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notify_me_app/providers/NotificationProvider.dart';
import 'package:notify_me_app/providers/firebase_provider.dart';
import 'package:notify_me_app/providers/theme_provider.dart';
import 'package:notify_me_app/router/router_helper.dart';
import 'package:notify_me_app/router/routes.dart';
import 'package:notify_me_app/resources/ConstantStrings.dart';
import 'package:notify_me_app/theme/dark_theme.dart';
import 'package:notify_me_app/theme/light_theme.dart';
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
    ChangeNotifierProvider(create: (context)=> di.sl<ThemeProvider>()),
    ChangeNotifierProvider(create: (context)=> di.sl<NotificationProvider>()),
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
    RouterHelper.setupRouter();
    //setting up firebase notification listener fow show notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = message.notification?.android;

      if(notification!=null && androidNotification!=null){
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: '@mipmap/ic_launcher'
            )
          )
        );
      }

    });

    //setting up for openapp according to notification type
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = message.notification?.android;
      if(notification!.body=="4"){
        Provider.of<NotificationProvider>(context,listen: false).setRemoteNotification = notification;
        Navigator.pushNamed(context, Routes.FEATURE_SCREEN_4);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:  Provider.of<FirebaseProvider>(context).getRouteAccordingToAuthentication(),
      onGenerateRoute: RouterHelper.router.generator,
      title: ConstantStrings.APP_NAME,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      debugShowCheckedModeBanner: false,
      navigatorKey: NotifyMeApp.navigatorKey,
    );
  }

}

