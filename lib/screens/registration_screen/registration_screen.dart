import 'package:flutter/material.dart';
import 'package:notify_me_app/decorations/text_decorations.dart';
import 'package:notify_me_app/decorations/widget_decorations.dart';
import 'package:notify_me_app/resources/ConstantStrings.dart';
import 'package:notify_me_app/resources/color_resources.dart';
import 'package:notify_me_app/resources/local_images.dart';
import 'package:notify_me_app/router/routes.dart';

class RegistrationScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegistrationScreenState();
  }

}

class _RegistrationScreenState extends State<RegistrationScreen>{
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSingInButtonEnabled = false;
  bool _isNewPasswordVisible = true;


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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage(LocalImages.app_logo),width: 200,height: 200,),
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
                                  Center(child: Text(ConstantStrings.Register_Now,style: TextDecorations.getBoldTextStyle(context,fontSize: 22.0,color: ColorResources.getPrimaryColor(context)),)),
                                  SizedBox(height: 16,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 16,),
                                          Text("Email Address",style: TextDecorations.getNormalTextStyle(context,color: ColorResources.getPrimaryColor(context)),),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        decoration: WidgetDecorations.getTextEditFormDecorationWithHint(context,"01XXXXXXXXX"),
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        focusNode: new FocusNode(),
                                        onChanged: (value){

                                        },
                                      ),
                                      SizedBox(height: 16,),
                                      Row(
                                        children: [
                                          SizedBox(width: 16,),
                                          Text("Password",style: TextDecorations.getNormalTextStyle(context,color: ColorResources.getPrimaryColor(context)),),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                            EdgeInsets.fromLTRB(16, 4, 4, 4),
                                            hintText: "Type Password",
                                            hintStyle: TextStyle(
                                                color:
                                                ColorResources.getPrimaryColorLight(context)),
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ColorResources.getHintColor(context),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(200.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ColorResources.getHintColor(context),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(200.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.redAccent,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(200.0),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                !_isNewPasswordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _isNewPasswordVisible =
                                                  !_isNewPasswordVisible;
                                                });
                                              },
                                            )),
                                        obscureText: _isNewPasswordVisible,
                                        focusNode: new FocusNode(),
                                        keyboardType: TextInputType.text,
                                        onChanged: (String value) {
                                          /*newPassword = value;
                                            setState(() {
                                              passwordValidation(context, newPassword);
                                            });*/
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16,),
                                  MaterialButton(
                                    elevation: 6,
                                    padding: EdgeInsets.all(16),
                                    child: Text(ConstantStrings.Continue,style: TextStyle(fontSize: 18,wordSpacing: 2),),
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
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

}