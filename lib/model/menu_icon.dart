import 'package:flutter/cupertino.dart';

class MenuIcon {
  final IconData icon;
  final String appName;
  bool status;

  MenuIcon({required this.icon, required this.appName, this.status=false});
}