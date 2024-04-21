import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/closepage.dart';
import 'package:web/model/media.dart';
import 'package:web/model/neo_container.dart';
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
                    childAspectRatio: 4/2
                  ),
                  itemCount: state.icons.length,
                  itemBuilder: (context, index) {
                    return Tooltip(
                      message: state.icons[index].string,
                      child: NeoCon(
                        radius: 15,
                        height: Media.height(),
                        width: Media.width(),
                        margin: const EdgeInsets.all(30),
                        color: Media.col().background,
                        child: MaterialButton(
                          onPressed: ()=> AppHelpers.showWarning(text: 'Under maintenance', dissmisable: true),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Container(
                                  height: Media.width()*0.06,
                                  width: Media.width()*0.1,
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset( state.icons[index].assets,
                                    fit: BoxFit.cover, ),
                                ),
                              ),
                              Text(state.icons[index].string, style: Media.themeQ().textTheme.labelLarge,)
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
}