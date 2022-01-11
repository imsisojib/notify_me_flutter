import 'package:flutter/cupertino.dart';
import 'package:notify_me_app/resources/color_resources.dart';
import 'package:notify_me_app/resources/dimensions.dart';

class TextDecorations{
  static TextStyle getNormalTextStyle(BuildContext context,{var color, var fontSize}){
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: fontSize==null? Dimensions.FONT_SIZE_DEFAULT : fontSize,
      fontWeight: FontWeight.w400,
      color: color==null? ColorResources.getTextColor(context) : color,
    );
  }

  static TextStyle getBoldTextStyle(BuildContext context,{var color, var fontSize}){
    return TextStyle(
        fontFamily: 'Montserrat',
        fontSize: fontSize==null? Dimensions.FONT_SIZE_DEFAULT : fontSize,
        fontWeight: FontWeight.w700,
        color: color==null? ColorResources.getTextColor(context) : color
    );
  }

}