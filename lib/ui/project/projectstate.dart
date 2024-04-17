import 'package:flutter/material.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/media.dart';
import 'package:web/model/menu_icon.dart';
import 'package:web/model/string_icon.dart';

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
  List<StringIcon> icons = [
    StringIcon('Pawoon POS', Icons.point_of_sale_sharp),
    StringIcon('Twintulip Ware', Icons.shop),
    StringIcon('Sofast Automobile', Icons.car_repair),
    StringIcon('Pawoon Owner', Icons.point_of_sale),
    StringIcon('Persist Personalia', Icons.person),
    StringIcon('Persist Reqruitment', Icons.people),
    StringIcon('IKN Super Apps', Icons.real_estate_agent),
    StringIcon('Mandiri DQMS', Icons.money),
    StringIcon('Shopee', Icons.shop),
    StringIcon('Dana', Icons.money)
  ];
}