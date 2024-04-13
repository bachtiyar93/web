import 'package:apphelper/helperapp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/control/managstate.dart';
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
                  width: 50,
                  radius: 10,
                  color: Colors.blue.shade50,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: ListView.separated(
                      itemCount: state.menu.length,
                      itemBuilder: (BuildContext context, int index) {
                        return iconMenu(index, state.menu[index].status,
                            data: state.menu[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10,);
                      },),
                  ),
                ),
              ),
              Expanded(child: Stack(
                children: [...state.listActivePage],
              ))
            ],
          );
        }
    );
  }

  Widget iconMenu(index,bool active, {required MenuIcon data}) {
    ManagState state = AppHelpers.getState<ManagState>();
    return InkWell(
      onTap: ()=>state.setActiveMenu(index),
      child: Tooltip(
        message: data.appName,
        child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: active?Colors.white:Colors.white.withAlpha(80),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(active)
                Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.blue,
                  ),
                  width: 3
                ),
                Icon(data.icon),
              ],
            )),
      ),
    );
  }
}
