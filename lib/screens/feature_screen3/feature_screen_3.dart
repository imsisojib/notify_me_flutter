import 'package:flutter/material.dart';
import 'package:notify_me_app/decorations/text_decorations.dart';
import 'package:notify_me_app/providers/NotificationProvider.dart';
import 'package:notify_me_app/resources/color_resources.dart';
import 'package:notify_me_app/resources/local_images.dart';
import 'package:provider/provider.dart';

class FeatureScreen3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FeatureScreen3State();
  }

}

class _FeatureScreen3State extends State<FeatureScreen3>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SingleChildScrollView(
                  child: Consumer<NotificationProvider>(
                    builder: (context,notificationProvider,child) =>Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage(LocalImages.app_logo),width: 100,height: 100,),
                        Center(child: Text("3",style: TextDecorations.getBoldTextStyle(context,fontSize: 22.0,color: ColorResources.getPrimaryColor(context)),)),
                        Center(child: Text("Feature Screen",style: TextDecorations.getBoldTextStyle(context,color: ColorResources.getPrimaryColor(context)),)),
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
                                    Center(child: Text(notificationProvider.remoteNotification.tittle,style: TextDecorations.getBoldTextStyle(context,fontSize: 22.0,color: ColorResources.getPrimaryColor(context)),)),
                                    SizedBox(height: 16,),
                                    Center(child: Text(notificationProvider.remoteNotification.body,style: TextDecorations.getBoldTextStyle(context,fontSize: 22.0,color: ColorResources.getPrimaryColor(context)),)),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

}