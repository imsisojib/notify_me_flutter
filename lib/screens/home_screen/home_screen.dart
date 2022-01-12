import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notify_me_app/decorations/text_decorations.dart';
import 'package:notify_me_app/decorations/widget_decorations.dart';
import 'package:notify_me_app/main.dart';
import 'package:notify_me_app/models/notification.dart';
import 'package:notify_me_app/providers/NotificationProvider.dart';
import 'package:notify_me_app/providers/firebase_provider.dart';
import 'package:notify_me_app/resources/color_resources.dart';
import 'package:notify_me_app/resources/local_images.dart';
import 'package:notify_me_app/router/routes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _tittleController = TextEditingController();
  var _bodyController = TextEditingController();
  var _featureController = TextEditingController();

  @override
  void initState() {

    _tittleController.text = "";
    _bodyController.text = "";
    _featureController.text = "1";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<NotificationProvider>(
          builder: (_,notificationProvider,child){

            if(notificationProvider.isNotificationReceived){
              //Navigator.pushNamed(context, "${notificationProvider.remoteNotification.feature}");
              try{
                SchedulerBinding.instance!.addPostFrameCallback((_) {
                  Navigator.of(context).pushNamed("${notificationProvider.remoteNotification.feature}");
                });
              }catch(e){

              }
              notificationProvider.updateIsNotificationReceived = false;

            }

            return Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Consumer<FirebaseProvider>(
                        builder: (context,firebaseProvider,child) =>Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(LocalImages.app_logo),width: 100,height: 100,),
                            Card(
                              elevation: 6,
                              color: Colors.white,
                              margin: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(24)),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                                width: double.infinity,
                                child: Form(
                                  key: _formKey,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(child: Text("Create Notification",style: TextDecorations.getBoldTextStyle(context,fontSize: 22.0,color: ColorResources.getPrimaryColor(context)),)),
                                        SizedBox(height: 16,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(width: 16,),
                                                Text("Notification Tittle",style: TextDecorations.getNormalTextStyle(context,color: ColorResources.getPrimaryColor(context)),),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            TextFormField(
                                              decoration: WidgetDecorations.getTextEditFormDecorationWithHint(context,"Tittle"),
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.next,
                                              focusNode: new FocusNode(),
                                              controller: _tittleController,
                                            ),
                                            SizedBox(height: 16,),
                                            Row(
                                              children: [
                                                SizedBox(width: 16,),
                                                Text("Notification Body",style: TextDecorations.getNormalTextStyle(context,color: ColorResources.getPrimaryColor(context)),),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            TextFormField(
                                              decoration: WidgetDecorations.getTextEditFormDecorationWithHint(context,"Body"),
                                              keyboardType: TextInputType.text,
                                              textInputAction: TextInputAction.next,
                                              focusNode: new FocusNode(),
                                              controller: _bodyController,
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                SizedBox(width: 16,),
                                                Text("Feature Screen (1 to 4)",style: TextDecorations.getNormalTextStyle(context,color: ColorResources.getPrimaryColor(context)),),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            TextFormField(
                                              decoration: WidgetDecorations.getTextEditFormDecorationWithHint(context,"Feature No"),
                                              keyboardType: TextInputType.number,
                                              textInputAction: TextInputAction.done,
                                              focusNode: new FocusNode(),
                                              controller: _featureController,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16,),
                                        MaterialButton(
                                          elevation: 6,
                                          padding: EdgeInsets.all(16),
                                          child: Text("Send Local Notification",style: TextStyle(fontSize: 18,wordSpacing: 2),),
                                          onPressed: (){
                                            String _body = _bodyController.text;
                                            String _tittle = _tittleController.text;
                                            String _feature = _featureController.text.trim();

                                            if(_body.isEmpty){
                                              Fluttertoast.showToast(msg: "Body can't be empty.");
                                              return;
                                            }

                                            if(_tittle.isEmpty){
                                              Fluttertoast.showToast(msg: "Tittle can't be empty.");
                                              return;
                                            }

                                            int? feature = int.tryParse(_feature);

                                            if(feature==null || feature<1 || feature>4){
                                              Fluttertoast.showToast(msg: "Invalid Feature No.");
                                              return;
                                            }
                                            flutterLocalNotificationsPlugin.show(
                                                DateTime.now().millisecond,
                                                _tittle,
                                                _body,
                                                NotificationDetails(
                                                    android: AndroidNotificationDetails(
                                                      channel.id,
                                                      channel.name,
                                                      icon: '@mipmap/ic_launcher',
                                                      importance: Importance.high,
                                                      playSound: true,
                                                    )
                                                )
                                            );
                                          },
                                          color: ColorResources.getPrimaryColor(context),
                                          textColor: ColorResources.COLOR_WHITE,
                                          minWidth: MediaQuery.of(context).size.width*1.0,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                                        ),
                                        SizedBox(height: 8,),
                                        MaterialButton(
                                          elevation: 6,
                                          padding: EdgeInsets.all(16),
                                          child: Text("Send FCM Notification",style: TextStyle(fontSize: 18,wordSpacing: 2),),
                                          onPressed: (){

                                            String _body = _bodyController.text;
                                            String _tittle = _tittleController.text;
                                            String _feature = _featureController.text.trim();

                                            if(_body.isEmpty){
                                              Fluttertoast.showToast(msg: "Body can't be empty.");
                                              return;
                                            }

                                            if(_tittle.isEmpty){
                                              Fluttertoast.showToast(msg: "Tittle can't be empty.");
                                              return;
                                            }

                                            int? feature = int.tryParse(_feature);

                                            if(feature==null || feature<1 || feature>4){
                                              Fluttertoast.showToast(msg: "Invalid Feature No.");
                                              return;
                                            }

                                            Data data = Data(tittle: _tittle,body: _body,feature: _feature);
                                            firebaseProvider.notificationRepository.sendNotification(NotificationInfo(to: "",data: data));
                                          },
                                          color: ColorResources.getPrimaryColor(context),
                                          textColor: ColorResources.COLOR_WHITE,
                                          minWidth: MediaQuery.of(context).size.width*1.0,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 40,
                              margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                              child: MaterialButton(
                                elevation: 6,
                                child: Text("Sign Out",style: TextStyle(fontSize: 18,wordSpacing: 2),),
                                onPressed: (){
                                  firebaseProvider.firebaseRepository.mAuth.signOut();
                                  Navigator.pushNamedAndRemoveUntil(context, Routes.WELCOME_SCREEN, (route) => false);
                                  Fluttertoast.showToast(msg: "Sign out Successful.",backgroundColor: Colors.green);
                                },
                                color: Colors.red,
                                textColor: ColorResources.COLOR_WHITE,
                                minWidth: MediaQuery.of(context).size.width*1.0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            );
          },

        ),
      ),
    );
  }

}