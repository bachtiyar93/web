import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/generated/assets.dart';
import 'package:web/model/media.dart';
import 'package:web/ui/project/smartbid/managsmartbid.dart';
import 'package:web/ui/project/smartbid/model/brand.dart';
import 'package:web/ui/project/smartbid/model/cars_model.dart';
import 'package:web/ui/project/smartbid/ui/home/brand_carosel.dart';
import 'package:web/ui/project/smartbid/ui/home/dealer_widget.dart';
import 'package:web/ui/project/smartbid/ui/home/available_cars.dart';
import 'package:web/ui/project/smartbid/ui/home/book_car.dart';
import 'package:web/ui/project/smartbid/ui/home/car_widget.dart';
class HomeSmartbid extends StatelessWidget {
  const HomeSmartbid({super.key});
  @override
  Widget build(BuildContext context) {
    ManagSmartbid state = AppHelpers.getState<ManagSmartbid>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "SmartBid Cars",
          style: GoogleFonts.mulish(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Tooltip(
              message: 'User account',
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Tooltip(
              message: 'Cart',
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 28,
              ),
            ),
          )
        ], systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.only(left: 30,),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 24.0, left: 16.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "PROMO",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                "view all",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),

                              const SizedBox(
                                width: 8,
                              ),

                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: Theme.of(context).colorScheme.primary,
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                    if(Media.width()<900)
                    SizedBox(
                      height: 300,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildDeals(state.listCars, context),
                      ),
                    ),
                    if(Media.width()>=900)
                      SizedBox(
                        height: 3*300,
                        child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 4/3
                          ),
                          children: buildDeals(state.listCars, context),
                        ),
                      ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AvailableCars()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          padding: const EdgeInsets.all(24),
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    "${state.listCars.length} Mobil Tersedia",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),

                                  const Text(
                                    "Long term and short term",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),

                                ],
                              ),

                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "TOP BRANDS",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),

                          Row(
                            children: [

                              Text(
                                "view all",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),

                              const SizedBox(
                                width: 8,
                              ),

                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: Theme.of(context).colorScheme.primary,
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: BrandCarosel(),
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
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildDeals(List<CarsModel> cars, context){
    List<Widget> list = [];
    for (var i = 0; i < 9; i++) {
      list.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookCar(car: cars[i])),
            );
          },
          child: Container(
              padding: const EdgeInsets.all(5),
              child: buildCar(cars[i], i))
        )
      );
    }
    return list;
  }



  List<Widget> buildNavigationItems(List<TabbarNavigationItem> listTabbar, BuildContext context){
    List<Widget> list = [];
    for (var a in listTabbar) {
      list.add(buildNavigationItem(a,  context));
    }
    return list;
  }

  Widget buildNavigationItem(TabbarNavigationItem item, BuildContext context){
    ManagSmartbid state = AppHelpers.getState<ManagSmartbid>();
    return GestureDetector(
      onTap: () => state.tabSelected,
      child: SizedBox(
        width: 50,
        child: Stack(
          children: <Widget>[
            state.tabSelected == item
            ? Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
              ),
            )
            : Container(),

            Center(
              child: Icon(
                item.iconData,
                color: state.tabSelected == item ? Theme.of(context).primaryColor : Colors.grey[400],
                size: 24,
              ),
            )

          ],
        ),
      ),
    );
  }

}