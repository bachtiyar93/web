import 'package:flutter/material.dart';
import 'package:web/control/managstate.dart';
import 'package:web/generated/assets.dart';
import 'package:web/model/media.dart';
import 'package:web/model/menu_icon.dart';
import 'package:web/model/string_image.dart';

class ProjectState extends ChangeNotifier{
  double height=Media.height();
  double width=Media.width();
  late MenuIcon menuIcon;
  init(String s, ManagState state){
    menuIcon= state.menu.where((element) => element.appName==s).first;
  }
  minimize() {
    menuIcon.windowMode=0;
    height=Media.height()*0.7;
    width=Media.width()*0.7;
    notifyListeners();
  }
  maximize(){
    menuIcon.windowMode=1;
    height=Media.height();
    width=Media.width();
    notifyListeners();
  }
  List<StringImage> icons = [
    StringImage('Pawoon POS', Assets.pawoon),
    StringImage('Twintulip Ware', Assets.twintulip),
    StringImage('Sofast Automobile', ''),
    StringImage('Pawoon Owner', ''),
    StringImage('Persist Personalia', ''),
    StringImage('Persist Reqruitment', ''),
    StringImage('IKN Super Apps', ''),
    StringImage('Mandiri DQMS', ''),
    StringImage('Shopee', ''),
    StringImage('Dana', '')
  ];
}