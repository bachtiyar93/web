import 'dart:async';

import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:web/ui/project/smartbid/managsmartbid.dart';
import 'package:web/ui/project/smartbid/model/cars_model.dart';

class BookCar extends StatefulWidget {

  final CarsModel car;

  const BookCar({super.key, required this.car});

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {

  int _currentImage = 0;

  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }
  late PageController _pageController;
  late Timer _timer;
  late ManagSmartbid state;

  @override
  void initState() {
    super.initState();
    state=AppHelpers.getState<ManagSmartbid>(listen: false);
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_pageController.page!.round() == _pageController.page) {
        int nextPage = (_pageController.page! + 1).toInt();
        if (nextPage < widget.car.images.length-1) {
          _pageController.animateToPage(
            nextPage,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 350),
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

  Widget buildIndicator(bool isActive){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
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

                            Row(
                              children: [

                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 22,
                                  )
                                ),

                                const SizedBox(
                                  width: 16,
                                ),

                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Tooltip(
                                    message: 'Bagikan',
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                  )
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.model,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.brand,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      Expanded(
                        child: Container(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: widget.car.images.length,
                            itemBuilder: (context, position) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16,),
                                    child: Hero(
                                      tag: widget.car.model,
                                      child: Image.asset(
                                        widget.car.images[position],
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  );
                            },
                          ),

                          // PageView(
                          //   physics: const BouncingScrollPhysics(),
                          //   onPageChanged: (int page){
                          //     setState(() {
                          //       _currentImage = page;
                          //     });
                          //   },
                          //   children: widget.car.images.map((path) {
                          //     return Container(
                          //       padding: const EdgeInsets.symmetric(horizontal: 16,),
                          //       child: Hero(
                          //         tag: widget.car.model,
                          //         child: Image.asset(
                          //           path,
                          //           fit: BoxFit.scaleDown,
                          //         ),
                          //       ),
                          //     );
                          //   }).toList(),
                          // ),
                        ),
                      ),

                      // widget.car.images.length > 1
                      // ? Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 16),
                      //   height: 30,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: buildPageIndicator(),
                      //   ),
                      // )
                      // : Container(),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              buildPricePerPeriod(
                                "Kondisi",
                                widget.car.condition?'Baru':'Bekas',
                                widget.car.condition?'':'2000 KM',
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                "Tenor",
                                "36",
                                'Bulan',
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                "Asuransi",
                                "All Risk",
                                'by ASTRA',
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Text(
                        "Spesifikasi",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),

                    Container(
                      height: 80,
                      padding: const EdgeInsets.only(top: 8, left: 16,),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildSpecificationCar("Warna", "White"),
                          buildSpecificationCar("Transmisi", "Automatic"),
                          buildSpecificationCar("Kursi", "4 seat"),
                          buildSpecificationCar("Mesin", "v10 2.0"),
                          buildSpecificationCar("Acc (0-100)", "3.2/s"),
                          buildSpecificationCar("Top speed", "200 km/h"),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "HARGA",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(
                  height: 4,
                ),

                Row(
                  children: [

                    Text(
                      'USD ${widget.car.price}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        decoration: TextDecoration.lineThrough
                      ),
                    ),

                    const SizedBox(
                      width: 8,
                    ),

                    Text(
                      "USD ${(widget.car.discount*widget.car.price/100).toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                  ],
                ),

              ],
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Pesan Sekarang",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPricePerPeriod(String topString, String midString, String bottomString){
    return Expanded(
      child: Container(
        height: 110,
        width: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey[300]!,
            width:  1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              topString,
              style: const TextStyle(
                color:  Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            Text(
              midString,
              style: TextStyle(
                color:  bottomString=='2000 KM' ? Colors.red :Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              bottomString,
              style: TextStyle(
                color: bottomString=='2000 KM' ? Colors.red : Colors.black,
                fontSize: 14,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data){
    return Container(
      width: 130,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16,),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          Text(
            data,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }

}