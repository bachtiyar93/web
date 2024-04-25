import 'package:flutter/material.dart';
import 'package:web/model/media.dart';
import 'package:web/model/neo_container.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeoCon(
      padding: const EdgeInsets.all(defaultPadding),
      radius: 10,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Analytic",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/smartbid/dashboard/icons/Documents.svg",
            icon: Icons.stacked_bar_chart,
            title: "Unit Kondisi Baru",
            amountOfFiles: "2345 Terdaftar",
            numOfFiles: 2345,
          ),
          StorageInfoCard(
            svgSrc: "assets/smartbid/dashboard/icons/media.svg",
            icon: Icons.stacked_bar_chart,
            title: "Unit Kondisi Bekas",
            amountOfFiles: "1534 Terdaftar",
            numOfFiles: 1534,
          ),
          StorageInfoCard(
            svgSrc: "assets/smartbid/dashboard/icons/folder.svg",
            icon: Icons.stacked_bar_chart,
            title: "Terjual Kondisi Baru",
            amountOfFiles: "1328 Terjual",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/smartbid/dashboard/icons/unknown.svg",
            icon: Icons.stacked_bar_chart,
            title: "Terjual Kondisi Bekas",
            amountOfFiles: "1402 Terjual",
            numOfFiles: 1402,
          ),
        ],
      ),
    );
  }
}
