import 'dart:developer';

import 'package:apphelper/apphelpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/model/media.dart';
import 'package:web/model/neo_container.dart';
import 'package:web/ui/project/smartbid/model/brand.dart';
import 'package:web/ui/project/smartbid/model/cars_model.dart';
import 'package:web/ui/project/smartbid/model/dummy_brand.dart';
import 'package:web/ui/project/smartbiddashboard/screens/dashboard/components/form_add_cars.dart';

class ManagSmartbid extends ChangeNotifier{
  List<CarsModel> listCars= getCarList();
  List<BrandCar> listBrand = listBrandCars();
  List<TabbarNavigationItem> listTab = getTabList();
  TabbarNavigationItem? tabSelected;
  List<Filter> filters = getFilterList();

  Filter selectedFilter= getFilterList().first;

  updateFilter(Filter filter) {
    log(filter.name);
    selectedFilter= filter;
    notifyListeners();
  }

  activateFormCar() {
    return showDialog(context: AppHelpers.navigation.currentContext!,
        builder: (BuildContext context){
      return NeoCon(
          width: Media.width(),
          margin: EdgeInsets.all(10),
          radius: 10,
          child: MobilForm());
        });
  }

}