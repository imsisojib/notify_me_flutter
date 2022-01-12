import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notify_me_app/decorations/text_decorations.dart';
import 'package:notify_me_app/decorations/widget_decorations.dart';
import 'package:notify_me_app/helper/email_checker.dart';
import 'package:notify_me_app/providers/firebase_provider.dart';
import 'package:notify_me_app/resources/ConstantStrings.dart';
import 'package:notify_me_app/resources/color_resources.dart';
import 'package:notify_me_app/resources/local_images.dart';
import 'package:notify_me_app/router/routes.dart';
import 'package:provider/provider.dart';

class VerificationAwaitingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _VerificationAwaitingScreen();
  }

}

class _VerificationAwaitingScreen extends State<VerificationAwaitingScreen>{


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                  padding: EdgeInsets.all(16),
                  child: Consumer<FirebaseProvider>(
                    builder: (context,firebaseProvider,child)=> Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage(LocalImages.app_logo),width: 200,height: 200,),
                        SizedBox(height: 16,),
                        Text("Verification Awaiting Screen",style: TextDecorations.getBoldTextStyle(context,color: ColorResources.getPrimaryColor(context),fontSize: 22.0),),
                        SizedBox(height: 16,),
                        Text("A verification link is sent to your email. Please verify your email and login again.",style: TextDecorations.getNormalTextStyle(context,color: ColorResources.getPrimaryColor(context)),),
                        SizedBox(height: 16,),
                        MaterialButton(
                          elevation: 6,
                          padding: EdgeInsets.all(16),
                          child: Text("I have verified Email",style: TextStyle(fontSize: 18,wordSpacing: 2),),
                          onPressed: () async{
                            Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN_SCREEN, (route) => false);
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
              ],
            )
        ),
      ),
    );
  }

}