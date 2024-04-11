import 'package:apphelper/helperwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:web/control/basestate.dart';
import 'package:web/routes.dart';
import 'package:web/ui/base.dart';
import 'package:web/ui/home/home.dart';
import 'control/managstate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: appRootTree(
          title: "Super View",
          themeMode: ThemeMode.light,
          initPage: Main.base,
          routes: {
            Main.base:(_)=> const Base(),
            Main.home:(_)=> const Home()

          }),

    );
  }
}

List<SingleChildWidget> providers =[
  ChangeNotifierProvider(
      create: (_)=> BaseState()),
  ChangeNotifierProvider(
      create: (_)=> ManagState())
];