import 'package:apphelper/helperapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:web/routes.dart';

class BaseState extends ChangeNotifier{
  void inistate()=> WidgetsBinding.instance.addPostFrameCallback((_){
    AppHelpers.navigation.openPageNamedNoNav(Main.home);
  });
}