import 'package:apphelper/helperapp.dart';
import 'package:flutter/material.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/menu_icon.dart';
import 'package:web/model/neo_container.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    ManagState state = AppHelpers.getState<ManagState>();
    return Container(
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
                return iconMenu(index,data:state.menu[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10,);
            },),
          ),
        ),
    );
  }

  Widget iconMenu(index, {required MenuIcon data}) {
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
              color: Colors.white.withAlpha(80),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(data.status!)
                Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.blue,
                  ),
                  width: 3
                ),
                const Icon(Icons.android),
              ],
            )),
      ),
    );
  }
}
