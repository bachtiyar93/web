import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:web/ui/project/smartbid/model/brand.dart';
import 'package:web/ui/project/smartbid/model/cars_model.dart';
import 'package:web/ui/project/smartbid/model/dummy_brand.dart';

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

}