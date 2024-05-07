import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/closepage.dart';
import 'package:web/model/media.dart';
import 'package:web/model/neo_container.dart';
import 'package:web/routes.dart';
import 'package:web/ui/project/projectstate.dart';
class Project extends StatelessWidget {
  const Project({super.key});

  @override Widget build(BuildContext context) {
    ManagState control = Media.getState<ManagState>(context);
    return Consumer<ProjectState>(builder: (context, state, child){
      state.init('Preview', control);
      return Center(
        child: NeoCon(
          height: state.height,
          width: state.width,
          radius: 10,
          color: Media.col().background,
          child: Column(
            children: [
              closePage(state, menuIcon: state.menuIcon),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: state.menuIcon.windowMode==1?4:3,
                    childAspectRatio: 4/3
                  ),
                  itemCount: state.projectMenu.length,
                  itemBuilder: (context, index) {
                    return Tooltip(
                      message: state.projectMenu[index].string,
                      child: NeoCon(
                        radius: 15,
                        height: Media.height(),
                        width: Media.width(),
                        margin: const EdgeInsets.all(30),
                        color: Media.col().background,
                        child: MaterialButton(
                          onPressed: (){
                            if(state.projectMenu[index].opressed==Main.ecommerce){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          MaterialButton(
                                            child: NeoCon(
                                                width:130,
                                                radius: 5,
                                                padding: const EdgeInsets.all(5),
                                                color: Media.themeQ().cardColor,
                                                margin: const EdgeInsets.all(5),
                                                child:  Text('Mobile Preview',style: Media.themeQ().textTheme.labelLarge)),
                                            onPressed: () => launchLink(),
                                          ),
                                          MaterialButton(
                                            child: NeoCon(
                                                width:130,
                                                radius: 5,
                                                padding: const EdgeInsets.all(5),
                                                color: Media.themeQ().cardColor,
                                                margin: const EdgeInsets.all(5),
                                                child:  Text('Web Preview',style: Media.themeQ().textTheme.labelLarge,)),
                                            onPressed: () {
                                              AppHelpers.navigation.openPageNamedNoNav(
                                                  state.projectMenu[index].opressed);
                                            },
                                          ),
                                          MaterialButton(
                                            child: NeoCon(
                                                width:130,
                                                radius: 5,
                                                padding: const EdgeInsets.all(5),
                                                color: Media.themeQ().cardColor,
                                                margin: const EdgeInsets.all(5),
                                                child:  Text('CMS Preview', style: Media.themeQ().textTheme.labelLarge,)),
                                            onPressed: () {
                                              AppHelpers.navigation.openPageNamedNoNav(
                                                  Main.dashboard);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );

                            }else {
                              AppHelpers.navigation.openPageNamedNoNav(
                                  state.projectMenu[index].opressed);
                            }
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                child: Container(
                                  height: Media.width()*0.06,
                                  width: Media.width()*0.1,
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset( state.projectMenu[index].assets,
                                    fit: BoxFit.fitWidth, ),
                                ),
                              ),
                              Text(state.projectMenu[index].string, style: Media.themeQ().textTheme.labelLarge,)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  launchLink() async {
    const url = 'https://drive.usercontent.google.com/u/0/uc?id=1S6dOxh5BqqMh9v2pNMTADYsObhwYsvSa&export=download';
    if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
    } else {
    throw 'Could not launch $url';
    }
  }
}