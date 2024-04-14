import 'package:apphelper/helperapp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Media {
  static T getState<T extends ChangeNotifier>(context,{bool listen = true}){
    return Provider.of<T>(context, listen:listen);
  }
  static height(){
    return MediaQuery.of(AppHelpers.navigation.currentContext!).size.height;
  }
  static width(){
    return MediaQuery.of(AppHelpers.navigation.currentContext!).size.width;
  }
  static orientation(){
    return MediaQuery.of(AppHelpers.navigation.currentContext!).orientation;
  }
  static MediaQueryData mediaQ(){
    return MediaQuery.of(AppHelpers.navigation.currentContext!);
  }
  static ColorScheme col(){
    return Theme.of(AppHelpers.navigation.currentContext!).colorScheme;
  }
}