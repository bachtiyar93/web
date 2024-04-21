import 'package:apphelper/apphelpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/ui/project/smartbid/managsmartbid.dart';
import 'package:web/ui/project/smartbid/model/brand.dart';

Widget buildDealer(BrandCar dealer, int index){
  ManagSmartbid state = AppHelpers.getState<ManagSmartbid>();
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 150,
    height: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(dealer.logo),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 5,
        ),

        Text(
          dealer.brand,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 2,
          ),
        ),

        Text("${state.listCars.where((element) => element.brand==dealer.brand).length} produk",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),

      ],
    ),
  );
}