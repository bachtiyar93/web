import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/control/managstate.dart';
import 'package:web/ui/profile/profilestate.dart';
import 'package:web/generated/assets.dart';
import 'package:web/model/closepage.dart';
import 'package:web/model/media.dart';
import 'package:web/model/neo_container.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ManagState control = Media.getState<ManagState>(context);
    return Consumer<ProfileState>(builder: (context, state, child){
      state.init('Profile', control);
      return Center(
        child: NeoCon(
          height: state.height,
          width: state.width,
          radius: 10,
          color: Media.col().background,
          child:  Column(
            children: [
              closePage(state, menuIcon: state.menuIcon),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NeoCon(
                        height: 150,
                        width: 150,
                        radius: 100,
                        color: Media.col().background,
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(Assets.assetsLogo),
                        )),
                    const SizedBox(height: 20),
                    const Text(
                      'Mr. Taufiq Nur Bahtiar, SE',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Bio: Flutter Developer',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Age: 30',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      'Tel: (+62) 87766 2269 99',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      'Location: Medan, Indonesia',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
