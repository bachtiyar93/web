import 'package:apphelper/helperapp.dart';
import 'package:flutter/cupertino.dart';

class ManagState extends ChangeNotifier{
  screen() {
    return MediaQuery.of(AppHelpers.navigation.currentContext!);
  }
}