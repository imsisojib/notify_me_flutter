import 'package:flutter/material.dart';

class WidgetHelper{
  static void keyBoardFocus(BuildContext context, FocusNode currentNode, FocusNode nextNode)
  {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }
}