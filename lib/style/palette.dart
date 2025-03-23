import 'package:flutter/material.dart';

class PaletteItem {
  final List<Color> backgroundColor;
  final String imagePath;
  final String smallImagePath;
  final double width;
  final double height;
  final BoxFit objectFit;
  final Color buttonColor;

  PaletteItem({
    required this.backgroundColor,
    required this.imagePath,
    required this.smallImagePath,
    required this.width,
    required this.height,
    required this.objectFit,
    required this.buttonColor,
  });
}

final List palette = [
  PaletteItem(
    backgroundColor: [Color(0x3D0000FF), Color(0x99C9C4F2)],
    imagePath: "assets/0.png",
    smallImagePath: "assets/small/small_veryUnpleasant.png",
    width: 266,
    height: 75,
    objectFit: BoxFit.contain,
    buttonColor: Color(0xFF0000FF),
  ),
  PaletteItem(
    backgroundColor: [Color(0x3D3A53FF), Color(0x99C9C4F2)],
    imagePath: "assets/1.png",
    smallImagePath: "assets/small/small_unpleasant.png",
    width: 266,
    height: 266,
    objectFit: BoxFit.contain,
    buttonColor: Color(0xFF3A53FF),
  ),
  PaletteItem(
    backgroundColor: [Color(0x3D0000FF), Color(0x99C9C4F2)],
    imagePath: "assets/2.png",
    smallImagePath: "assets/small/small_littleUnpleasant.png",
    width: 266,
    height: 266,
    objectFit: BoxFit.contain,
    buttonColor: Color(0xFF694DFF),
  ),
  PaletteItem(
    backgroundColor: [Color(0x3D8749EB), Color(0x99C9C4F2)],
    imagePath: "assets/3.png",
    smallImagePath: "assets/small/small_normal.png",
    width: 266,
    height: 266,
    objectFit: BoxFit.contain,
    buttonColor: Color(0xFF8749EB),
  ),
  PaletteItem(
    backgroundColor: [Color(0x3DB449EB), Color(0x99C9C4F2)],
    imagePath: "assets/4.png",
    smallImagePath: "assets/small/small_littlePleasant.png",
    width: 266,
    height: 266,
    objectFit: BoxFit.contain,
    buttonColor: Color(0xFFB449EB),
  ),
  PaletteItem(
    backgroundColor: [Color(0x3DE149EB), Color(0x99C9C4F2)],
    imagePath: "assets/5.png",
    smallImagePath: "assets/small/small_pleasant.png",
    width: 266,
    height: 266,
    objectFit: BoxFit.contain,
    buttonColor: Color(0xFFE149EB),
  ),
  PaletteItem(
    backgroundColor: [Color(0x1FFF49FF), Color(0x99C9C4F2)],
    imagePath: "assets/6.png",
    smallImagePath: "assets/small/small_veryPleasant.png",
    width: 266,
    height: 266,
    objectFit: BoxFit.contain,
    buttonColor: Color(0xFFFF49FF),
  ),
];
