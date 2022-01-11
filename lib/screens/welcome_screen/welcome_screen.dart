import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify_me_app/decorations/text_decorations.dart';
import 'package:notify_me_app/decorations/widget_decorations.dart';
import 'package:notify_me_app/resources/ConstantStrings.dart';
import 'package:notify_me_app/resources/color_resources.dart';
import 'package:notify_me_app/resources/dimensions.dart';
import 'package:notify_me_app/resources/local_images.dart';
import 'package:notify_me_app/router/routes.dart';

class WelcomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WelcomeScreenState();
  }

}

class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorResources.getBackgroundColor(context),
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-20,
                child: SingleChildScrollView(
                  child:  Column(
                    children: [
                      SizedBox(height: 32,),
                      Image(image: AssetImage(LocalImages.app_logo),width: 200,height: 200,fit: BoxFit.cover,),
                      SizedBox(height: 16,),
                      Text(ConstantStrings.Welcome,style: TextDecorations.getBoldTextStyle(context,color: ColorResources.getPrimaryColor(context),fontSize: 22.0),),
                      SizedBox(height: 8,),
                      Padding(padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_LARGE,right: Dimensions.PADDING_SIZE_EXTRA_LARGE),child: Text(ConstantStrings.DemoText,style: TextDecorations.getNormalTextStyle(context),softWrap: true,textAlign: TextAlign.center,)),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.getRegistrationRoute());
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 24, right: 24),
                        decoration: WidgetDecorations.getBackgroundWithBorder(color: ColorResources.getPrimaryColorLight(context),radius: 8.0),
                        width: MediaQuery.of(context).size.width-48,
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(ConstantStrings.Register_Now,style: TextDecorations.getNormalTextStyle(context,color: ColorResources.COLOR_WHITE),),
                              Icon(Icons.arrow_forward,color: ColorResources.COLOR_WHITE,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Text(ConstantStrings.Already_have_account,style: TextDecorations.getNormalTextStyle(context,color: ColorResources.getGreyColor(context),fontSize: 12.0),),
                        SizedBox(width: 10,),
                        InkWell(onTap: (){
                          Navigator.pushNamed(context, Routes.getLoginRoute());
                        },child: Text(ConstantStrings.Login,style: TextDecorations.getBoldTextStyle(context,color: ColorResources.getPrimaryColor(context)),)),

                      ],
                    )
                  ],
                ),bottom: 40,),
              Positioned(child: Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
                color: ColorResources.getPrimaryColorDark(context),
              ),left: 0,right: 0,bottom: 0,)
            ],
          )
      ),
    );
  }

}
