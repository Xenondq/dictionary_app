import 'package:flutter/material.dart';

Container containers(
    {required Widget childs, required double heights, required double widths}) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 246, 232, 223),
          Color.fromARGB(255, 254, 174, 150),
          Color.fromARGB(255, 254, 151, 156),
          Color.fromARGB(183, 84, 46, 189),
        ],
        end: Alignment(1.5, 0.5),
        begin: Alignment(-1.1, 2),
        stops: [
          0.1,
          0.3,
          0.5,
          0.9,
        ],
      ),
    ),
    height: heights,
    width: widths,
    child: childs,
  );
}
