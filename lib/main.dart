import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:web/control/basestate.dart';
import 'package:web/ui/profile/profilestate.dart';
import 'package:web/ui/project/projectstate.dart';
import 'package:web/ui/project/smartbid/managsmartbid.dart';
import 'package:web/ui/project/smartbid/ui/home/home.dart';
import 'package:web/ui/project/smartbiddashboard/screens/dashboard/components/form_add_cars.dart';
import 'package:web/ui/project/smartbiddashboard/screens/main/main_screen.dart';
import 'package:web/ui/settings/settingstate.dart';
import 'package:web/routes.dart';
import 'package:web/ui/base.dart';
import 'package:web/ui/home/home.dart';
import 'control/managstate.dart';
import 'ui/project/smartbiddashboard/controllers/MenuAppController.dart';

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
      child: MaterialApp(
          title: "Taufiq Super app",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          navigatorKey: AppHelpers.navigation.navigatorKey,
          scaffoldMessengerKey: AppHelpers.navigation.messengerKey,
          themeMode: ThemeMode.light,
          initialRoute: Main.base,
          routes: {
            Main.base:(_)=> const Base(),
            Main.home:(_)=> const Home(),
            Main.ecommerce:(_)=> const HomeSmartbid(),
            Main.dashboard:(_)=> const MainScreenSmartbidDashboard(),
            Main.formcar:(_)=> MobilForm(),
          }),

    );
  }
}

List<SingleChildWidget> providers =[
  ChangeNotifierProvider(
      create: (_)=> BaseState()),
  ChangeNotifierProvider(
      create: (_)=> ManagState()),
  ChangeNotifierProvider(
      create: (_)=> ProfileState()),
  ChangeNotifierProvider(
      create: (_)=> SettingState()),
  ChangeNotifierProvider(
      create: (_)=> ProjectState()),
  ChangeNotifierProvider(create: (_)=> ManagSmartbid()),
  ChangeNotifierProvider(
    create: (context) => MenuAppController(),
  ),
];