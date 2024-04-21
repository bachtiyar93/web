import 'package:flutter/material.dart';
import 'package:web/control/managstate.dart';
import 'package:web/generated/assets.dart';
import 'package:web/model/media.dart';
import 'package:web/model/menu_icon.dart';
import 'package:web/model/string_image.dart';
import 'package:web/routes.dart';

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
  List<StringImageProject> projectMenu = [
    StringImageProject('Pawoon POS', Assets.assetsPawoon,''),
    StringImageProject('Twintulip Ware', Assets.assetsTwintulip,''),
    StringImageProject('SmartBid Cars', Assets.assetsSmartbid,Main.smartbid),
    StringImageProject('Pawoon Owner', '',''),
    StringImageProject('Persist Personalia', '',''),
    StringImageProject('Persist Reqruitment', '',''),
    StringImageProject('IKN Super Apps', '',''),
    StringImageProject('Mandiri DQMS', '',''),
    StringImageProject('Shopee', '',''),
    StringImageProject('Dana', '','')
  ];
}