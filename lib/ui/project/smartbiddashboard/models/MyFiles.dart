import 'package:flutter/material.dart';
import 'package:web/ui/project/smartbiddashboard/constants.dart';

class CloudStorageInfo {
  final String? numOfFiles, svgSrc, title, totalStorage;
  final IconData? icon;
  final int?  percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.icon,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "8 Mobil Tersedia",
    numOfFiles: '1328 Terjual',
    icon: Icons.car_repair,
    totalStorage: "Kondisi Baru",
    color: primaryColor,
    percentage: 95,
  ),
  CloudStorageInfo(
    title: "123 Mobil Tersedia",
    numOfFiles: '1233 Terjual',
    icon: Icons.car_repair,
    totalStorage: "Kondisi Bekas",
    color: primaryColor,
    percentage: 80,
  ),
  CloudStorageInfo(
    title: "15 Merek Terdaftar",
    numOfFiles: '5 Merek Tersedia',
    svgSrc: "assets/smartbid/dashboard/icons/Documents.svg",
    icon: Icons.local_activity,
    totalStorage: "",
    color: primaryColor,
    percentage: 10,
  ),
];
