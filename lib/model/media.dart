import 'package:apphelper/helperapp.dart';
import 'package:flutter/material.dart';

class Media {
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