import 'package:apphelper/apphelpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web/model/neo_container.dart';
import 'package:web/ui/project/smartbid/managsmartbid.dart';
import 'package:web/ui/project/smartbid/model/cars_model.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ManagSmartbid state = AppHelpers.getState<ManagSmartbid>();
    return NeoCon(
      padding: const EdgeInsets.all(defaultPadding),
      radius: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Unit Kendaraan",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: const [
                DataColumn(
                  label: Text("Type"),
                ),
                DataColumn(
                  label: Text("Merek"),
                ),
                DataColumn(
                  label: Text("Potongan/%"),
                ),
                DataColumn(
                  label: Text("Harga (USD)"),
                ),
              ],
              rows: List.generate(
                state.listCars.length,
                (index) => recentFileDataRow(state.listCars[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(CarsModel fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.asset(
              fileInfo.images.first,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.model),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.brand),),
      DataCell(Text("${fileInfo.discount} %")),
      DataCell(Text("USD ${fileInfo.price}")),
    ],
  );
}
