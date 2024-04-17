import 'package:flutter/cupertino.dart';

class MenuIcon {
  final IconData icon;
  final String appName;
  bool status;
  int windowMode;
  Widget? widget;

  MenuIcon({required this.icon, required this.appName, required this.status, required this.windowMode, this.widget});
}