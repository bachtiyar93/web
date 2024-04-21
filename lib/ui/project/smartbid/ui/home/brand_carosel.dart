import 'dart:async';
import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:web/ui/project/smartbid/managsmartbid.dart';
import 'package:web/ui/project/smartbid/model/brand.dart';
import 'package:web/ui/project/smartbid/ui/home/dealer_widget.dart';

class BrandCarosel extends StatefulWidget {
  @override
  _BrandCaroselState createState() => _BrandCaroselState();
}

class _BrandCaroselState extends State<BrandCarosel> {
  late PageController _pageController;
  late Timer _timer;
  late ManagSmartbid state;

  @override
  void initState() {
    super.initState();
    state = AppHelpers.getState<ManagSmartbid>(listen: false);
    _pageController = PageController(initialPage: 0, viewportFraction: 1/5);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.page!.round() == _pageController.page) {
        int nextPage = (_pageController.page! + 1).toInt();
        if (nextPage < state.listBrand.length-2) { // Replace 4 with the actual number of pages - 1
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (context, position) {
        return buildBrand(state.listBrand)[position];
      },
    );
  }
}
List<Widget> buildBrand(List<BrandCar> dealers){
  List<Widget> list = [];
  for (var i = 0; i < dealers.length; i++) {
    list.add(buildDealer(dealers[i], i));
  }
  return list;
}