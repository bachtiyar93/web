import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:web/model/menu_icon.dart';
import 'package:web/ui/dashboard/dashboard.dart';
import 'package:universal_html/html.dart';

class ManagState extends ChangeNotifier{
  List<Widget> listDashboard=[
    const Dashboard()
  ];
  handler(){
    return document.onContextMenu.listen((event) => event.preventDefault());
  }
  List<MenuIcon> menu =[
    MenuIcon(icon: Icons.android, appName: 'Android', status: true),
    MenuIcon(icon: Icons.book, appName: 'Book', status: false),
    MenuIcon(icon: Icons.navigation, appName: 'Navigation', status: false),
    MenuIcon(icon: Icons.ac_unit, appName: 'Cold', status: false),
  ];

  void setActiveMenu(index) {
    menu[index].status=true;
    notifyListeners();
  }
}