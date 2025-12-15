import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class Iconwidget extends StatelessWidget {
  const Iconwidget({
    super.key,
    required String this.iconpath,
    Color? this.colorfilter,
    Color? this.color,
  });

  final Color? color;
  final Color? colorfilter;
  final String iconpath;
  Widget build(BuildContext context) {
    return Container(
      width: 30, // outer circle size
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: color ?? Colors.transparent,
          width: 2,
        ), // circle border
      ),
      child: Center(
        child: SvgPicture.asset(
          iconpath,
          width: 25,
          height: 25,
          fit: BoxFit.cover,
          colorFilter: colorfilter != null
              ? ColorFilter.mode(colorfilter!, BlendMode.srcIn)
              : null, // ✅ keeps original SVG color
        ),
      ),
    );
  }
}
