import 'package:flutter/material.dart';

const arkaplan = "assets/arkaplan.jpg";
Container containers(
    {required Widget childs, required double heights, required double widths}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(fit: BoxFit.fill, image: AssetImage(arkaplan)),
    ),
    height: heights,
    width: widths,
    child: childs,
  );
}
