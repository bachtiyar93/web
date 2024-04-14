import 'package:flutter/cupertino.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/media.dart';
import 'package:web/model/menu_icon.dart';

class ProfileState extends ChangeNotifier{
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

}