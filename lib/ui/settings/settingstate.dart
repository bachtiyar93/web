import 'package:flutter/material.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/media.dart';
import 'package:web/model/menu_icon.dart';
import 'package:web/model/string_icon.dart';

class SettingState extends ChangeNotifier{
  double height=Media.height();
  double width=Media.width();
  late MenuIcon menuIcon;
  init(String s, ManagState state){
    menuIcon= state.menu.where((element) => element.appName==s).first;
  }
  minimize() {
    menuIcon.windowMode=0;
    height=Media.height()*0.7;
    width=Media.width()*0.3;
    notifyListeners();
  }
  maximize(){
    menuIcon.windowMode=1;
    height=Media.height();
    width=Media.width();
    notifyListeners();
  }
  List<StringIcon> menuSettings=[
    StringIcon('Language',Icons.flag_outlined),
    StringIcon('Theme', Icons.theater_comedy_outlined),
    StringIcon('About Us',Icons.help_outline_outlined)];

}