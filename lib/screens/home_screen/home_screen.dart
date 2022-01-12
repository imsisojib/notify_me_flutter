import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notify_me_app/decorations/text_decorations.dart';
import 'package:notify_me_app/decorations/widget_decorations.dart';
import 'package:notify_me_app/helper/widget_helper.dart';
import 'package:notify_me_app/providers/firebase_provider.dart';
import 'package:notify_me_app/resources/ConstantStrings.dart';
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
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          focusNode: new FocusNode(),
                                          onFieldSubmitted: (term){

                                          },
                                          onChanged: (value){

                                          },
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
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          focusNode: new FocusNode(),
                                          onFieldSubmitted: (term){

                                          },
                                          onChanged: (value){

                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16,),
                                    MaterialButton(
                                      elevation: 6,
                                      padding: EdgeInsets.all(16),
                                      child: Text("Send Notification",style: TextStyle(fontSize: 18,wordSpacing: 2),),
                                      onPressed: (){
                                        Navigator.pushNamed(context, Routes.getHomeScreen());
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
        ),
      ),
    );
  }

}