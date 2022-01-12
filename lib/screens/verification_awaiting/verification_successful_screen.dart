import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify_me_app/decorations/text_decorations.dart';
import 'package:notify_me_app/providers/firebase_provider.dart';
import 'package:notify_me_app/resources/color_resources.dart';
import 'package:notify_me_app/resources/local_images.dart';
import 'package:notify_me_app/router/routes.dart';
import 'package:provider/provider.dart';

class VerificationSuccessfulScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _VerificationSuccessfulScreenState();
  }

}

class _VerificationSuccessfulScreenState extends State<VerificationSuccessfulScreen>{


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
                        Text("Verification Successful",style: TextDecorations.getBoldTextStyle(context,color: ColorResources.getPrimaryColor(context),fontSize: 22.0),),
                        SizedBox(height: 16,),
                        Text("Thank you for verifying your email.",style: TextDecorations.getNormalTextStyle(context,color: ColorResources.getPrimaryColor(context)),),
                        SizedBox(height: 16,),
                        MaterialButton(
                          elevation: 6,
                          padding: EdgeInsets.all(16),
                          child: Text("Go To HomePage",style: TextStyle(fontSize: 18,wordSpacing: 2),),
                          onPressed: () async{
                            Navigator.pushNamedAndRemoveUntil(context, Routes.getHomeScreen(), (route) => false);
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