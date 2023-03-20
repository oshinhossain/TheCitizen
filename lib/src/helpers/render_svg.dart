import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/constants.dart';

class RenderSvg extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final Color? color;
  RenderSvg({required this.path, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '${Constants.svgPath}/$path.svg',
      height: height,
      width: width,
      color: color,
    );
  }
}
