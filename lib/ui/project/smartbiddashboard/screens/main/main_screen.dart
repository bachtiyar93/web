import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/ui/project/smartbiddashboard/controllers/MenuAppController.dart';
import 'package:web/ui/project/smartbiddashboard/responsive.dart';
import 'package:web/ui/project/smartbiddashboard/screens/dashboard/dashboard_screen.dart';

import 'components/side_menu.dart';

class MainScreenSmartbidDashboard extends StatelessWidget {
  const MainScreenSmartbidDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
