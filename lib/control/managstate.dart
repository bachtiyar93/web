import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web/model/menu_icon.dart';
import 'package:web/ui/dashboard/dashboard.dart';
import 'package:universal_html/html.dart';
import 'package:web/ui/profile/profile.dart';

class ManagState extends ChangeNotifier{
  List<Widget> listDashboard=[
    const Dashboard(),
  ];
  List<Widget> listActivePage=[];
  handler(){
    return document.onContextMenu.listen((event) => event.preventDefault());
  }
  List<MenuIcon> menu =[
    MenuIcon(icon: Icons.person, appName: 'Profile', status: false),
    MenuIcon(icon: Icons.book, appName: 'Book', status: false),
    MenuIcon(icon: Icons.navigation, appName: 'Navigation', status: false),
    MenuIcon(icon: Icons.ac_unit, appName: 'Cold', status: false),
  ];

  void setActiveMenu(index) {
    MenuIcon data = menu[index];
    if (data.appName=='Profile' && !data.status && !listActivePage.contains(const Profile())){
      listActivePage.add(const Profile());
    }
    if (!data.status) {
      data.status = true;
    }
    notifyListeners();
  }

  closePage(String page) {
    menu.where((element) => element.status).first.status=false;
    if(page=='Profile'){
      listActivePage.removeAt(0);
    }
    notifyListeners();
  }

}