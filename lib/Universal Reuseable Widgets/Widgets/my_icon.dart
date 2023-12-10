import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyIcon extends StatelessWidget {
   MyIcon({super.key, required this.icon, this.color, this.size = 14, });
  final IconData icon;
  double? size;
  Color? color;
  String? label;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size?.sp, color: color, weight: 20, semanticLabel: label,);
  }
}
