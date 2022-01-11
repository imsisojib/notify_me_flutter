import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notify_me_app/resources/color_resources.dart';

class WidgetDecorations{
  static BoxDecoration getBackgroundWithBorder({var color,var radius,var borderColor, var borderWidth}){
    return BoxDecoration(
      color: color==null? Colors.white : color,
      border: Border.all(color: borderColor==null? Colors.white: borderColor,width: borderWidth==null? 1: borderWidth),
      borderRadius: radius==null? BorderRadius.all(Radius.circular(200)) : BorderRadius.all(Radius.circular(radius)),

    );
  }

  static InputDecoration getTextEditFormDecorationWithHint(BuildContext context,String hintText){
    return InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(16, 4, 4, 4),
        hintText: hintText,
        hintStyle: TextStyle(
            color: ColorResources.getHintColor(context),
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorResources.getHintColor(context),
          ),
          borderRadius: BorderRadius.circular(200.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorResources.getHintColor(context),
          ),
          borderRadius: BorderRadius.circular(200.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.circular(200.0),
        )
    );
  }

  /*static InputDecoration getTextEditFormDecorationWithHintWithBackgroundColor(String hintText){
    return InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(16, 4, 4, 4),
        hintText: hintText,
        hintStyle: TextStyle(
            color: ColorsCollection().textHintColor
        ),
        filled: true,
        fillColor: Colors.blue[50],
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsCollection().textHintColor,
          ),
          borderRadius: BorderRadius.circular(200.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsCollection().textHintColor,
          ),
          borderRadius: BorderRadius.circular(200.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.circular(200.0),
        )
    );
  }*/

  static InputDecoration getTextEditFormWithoutBorder(){
    return InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(200.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(200.0),
      ),
      fillColor: Colors.white,
    );
  }

  static InputDecoration getTextEditFormDecoration(String labelText, String hintText){
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  static BoxDecoration getButtonWhiteBackgroundWithRadiusCorner(){
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(200)),
    );
  }

  static BoxDecoration getCardStyleWhiteBackgroundWithRadiusCorner(){
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(24)),
    );
  }

/*  static BoxDecoration getContainerDecorationWithStrokeAndRadius(){
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: ColorsCollection().textHintColor,),
      borderRadius: BorderRadius.all(Radius.circular(24)),
    );
  }*/

}