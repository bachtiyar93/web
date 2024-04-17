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
        backgroundColor: Media.col().background,
        body: Container(
          height: Media.height(),
          width: Media.width(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.assetsWallpaper),
              fit: BoxFit.cover
            ),
          ),
          child: state.pageHome
        ),
      );
    });
  }
}