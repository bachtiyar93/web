import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/search_textfield.dart';
import 'package:web/ui/settings/settingstate.dart';
import 'package:web/model/closepage.dart';
import 'package:web/model/media.dart';
import 'package:web/model/neo_container.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    ManagState control = Media.getState<ManagState>(context);
    return Consumer<SettingState>(builder: (context, state, child){
      state.init('Settings', control);
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
                child: Row(
                  children: [
                    NeoCon(
                      width: Media.width()*0.07,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: ListView.separated(
                          itemCount: state.menuSettings.length+1,
                          itemBuilder: (BuildContext context, int index) {
                            if(index==0){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: const SearchTextField());
                            }
                            else{
                              return SizedBox(
                                  height: Media.height()*0.03,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(state.menuSettings[index-1].icon, color: Media.themeQ().iconTheme.color,),
                                  const SizedBox(
                                    width: 4),
                                      Text(state.menuSettings[index-1].string, style: Media.themeQ().textTheme.labelMedium,),
                                    ],
                                  ));
                            }
                          }, separatorBuilder: (BuildContext context, int index) {
                            return  const SizedBox(
                                height: 5);
                        },
                        ),
                      ),
                    ),
                    Container()
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
