import 'package:apphelper/helperapp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/media.dart';
import 'package:web/model/menu_icon.dart';
import 'package:web/model/neo_container.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ManagState>(
        builder: (context, state, child) {
          return
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: NeoCon(
                  width: 58,
                  radius: 10,
                  color: Media.col().background.withAlpha(255),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: state.menu.length-1,
                            itemBuilder: (BuildContext context, int index) {
                              return iconMenu(index, state.menu[index].status,
                                  data: state.menu[index]);
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 10,);
                            },),
                        ),
                        iconMenu(state.menu.length-1, state.menu.last.status, data: state.menu.last)
                      ],
                    ),
                  ),
                ),
              ),
              if(state.activePage!=null && state.activePage!.widget!=null)
              Expanded(child: state.activePage!.widget!)
            ],
          );
        }
    );
  }

  Widget iconMenu(index,bool active, {required MenuIcon data}) {
    ManagState state = AppHelpers.getState<ManagState>();
    return MaterialButton(
      color: active?Media.col().onPrimary:Media.col().onInverseSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), ),
      onPressed: ()=>state.setActiveMenu(index),
      child: Tooltip(
        message: data.appName,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(active)
            Container(
              margin: const EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.blue,
              ),
              width: Media.width()*0.001,
              height: Media.height()*0.015,
            ),
            Icon(data.icon, color: active?Media.themeQ().iconTheme.color:Colors.black54,),
          ],
        ),
      ),
    );
  }
}