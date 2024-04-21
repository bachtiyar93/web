import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:web/control/managstate.dart';
import 'package:web/model/media.dart';
import 'package:web/model/menu_icon.dart';

Widget closePage (control,{required MenuIcon menuIcon}) {
  ManagState state = AppHelpers.getState<ManagState>();
    return  Container(
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Text(menuIcon.appName, style: Media.themeQ().textTheme.labelMedium,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: ()=> menuIcon.windowMode==1?control.minimize():control.maximize(),
                  color: Colors.yellow,
                  height: 15,
                  minWidth: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), ),
                  child: SizedBox(
                      height: 15,
                      width: 15,
                      child: Icon(menuIcon.windowMode==0?Icons.home_max:Icons.minimize, size: 10,)),
                ),
                const SizedBox(width: 5,),
                MaterialButton(
                  onPressed: ()=> state.closePage(),
                  color: Colors.red,
                  height: 15,
                  minWidth: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), ),
                  child:  const SizedBox(
                      height: 15,
                      width: 15,
                      child: Icon(Icons.close, size: 10,)), )
              ],
            ),
          ),
        ],
      ),
    );
  }
