import 'package:apphelper/apphelpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web/generated/assets.dart';
import 'package:web/model/media.dart';
import 'package:web/ui/project/smartbid/managsmartbid.dart';
import 'package:web/ui/project/smartbid/model/cars_model.dart';
import 'package:web/ui/project/smartbid/ui/home/book_car.dart';
import 'package:web/ui/project/smartbid/ui/home/car_widget.dart';

class AvailableCars extends StatelessWidget {
  const AvailableCars({super.key});

  Widget build(BuildContext context) {
    ManagSmartbid state = AppHelpers.getState<ManagSmartbid>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 28,
                        )
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    Row(
                      children: [
                        Text(
                          "Unit Tersedia (${state.listCars.length})",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            buildFilterIcon(context),
                            Row(
                              children: buildFilters(context),
                            ),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    Expanded(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        childAspectRatio: 1 / 1.55,
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: state.listCars.map((item) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BookCar(car: item)),
                              );
                            },
                            child: buildCar(item, null)
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              color: Media.themeQ().primaryColor,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width:500,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Expanded(child: Image.asset(Assets.assetsSmartbid, fit: BoxFit.fitHeight,)),
                        const SizedBox(height: 5,),
                        const Text('SMARTBID - PT ANUGERAH LELANG INDONESIA.')
                      ],
                    ),
                  ),
                  const Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width:150,
                        child: ListTile(
                          title: Icon(Icons.facebook),
                          subtitle: Text('Facebook', textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(
                        width:150,
                        child: ListTile(
                          title: Icon(Icons.call),
                          subtitle: Text('Hotline', textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(
                        width:150,
                        child: ListTile(
                          title: Icon(Icons.help),
                          subtitle: Text('Help', textAlign: TextAlign.center,),
                        ),
                      ),

                    ],))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFilterIcon(BuildContext context){
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  List<Widget> buildFilters(BuildContext context){
    ManagSmartbid state = AppHelpers.getState<ManagSmartbid>();
    List<Widget> list = [];
    for (var i = 0; i < state.filters.length; i++) {
      list.add(buildFilter(state.filters[i], context));
    }
    return list;
  }

  Widget buildFilter(Filter filter, BuildContext context){
    ManagSmartbid state = AppHelpers.getState<ManagSmartbid>();
    return GestureDetector(
      onTap: ()=> state.updateFilter(filter),
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          filter.name,
          style: TextStyle(
            color: state.selectedFilter == filter ? Theme.of(context).focusColor : Colors.grey.shade700,
            fontSize: 16,
            fontWeight: state.selectedFilter == filter ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}