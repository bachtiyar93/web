import 'package:apphelper/helperapp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/control/managstate.dart';
import 'package:web/generated/assets.dart';
import 'package:web/model/media.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ManagState>(
        builder: (context, state, child) {
          return
      Scaffold(
        body: Listener(
          onPointerDown: _onPointerDown,
          child: Stack(
            children: [
              SizedBox(
                  height: Media.height(),
                  width: Media.height() > Media.width()
                      ? Media.height() * 3
                      : Media.width(),
                  child: Image.asset(
                    Assets.assetsWallpaper,
                    fit: Media.height() > Media.width()
                        ? BoxFit.fitHeight
                        : BoxFit.fill,
                  )),
              ...state.listDashboard
            ],
          ),
        ),
      );
    });
  }
}

/// Callback when mouse clicked on `Listener` wrapped widget.
Future<void> _onPointerDown(PointerDownEvent event) async {
  BuildContext context = AppHelpers.navigation.currentContext!;
  // Check if right mouse button clicked
  if (event.kind == PointerDeviceKind.mouse &&
      event.buttons == kSecondaryMouseButton) {
    final overlay =
    Overlay
        .of(context)
        .context
        .findRenderObject() as RenderBox;
    final menuItem = await showMenu<int>(
        context: context,
        items: [
          PopupMenuItem(child: Text('Copy'), value: 1),
          PopupMenuItem(child: Text('Cut'), value: 2),
        ],
        position: RelativeRect.fromSize(
            event.position & Size(48.0, 48.0), overlay.size));
    // Check if menu item clicked
    switch (menuItem) {
      case 1:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Copy clicked'),
          behavior: SnackBarBehavior.floating,
        ));
        break;
      case 2:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Cut clicked'),
            behavior: SnackBarBehavior.floating));
        break;
      default:
    }
  }
}