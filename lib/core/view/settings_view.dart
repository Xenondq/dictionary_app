import 'package:dictionary_app/core/widgets/background_image.dart';
import 'package:dictionary_app/project/const/project_const.dart';
import 'package:dictionary_app/project/padding/project_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: containers(
        widths: MediaQuery.of(context).size.width,
        heights: MediaQuery.of(context).size.height,
        childs: Column(
          children: [
            Padding(
              padding: const OnlyTop.all(),
              child: _baykusButton(context),
            ),
            Padding(
              padding: const BaykusPadding.all(),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 110, 112, 168),
                          borderRadius: BorderRadius.circular(30)),
                      width: 250,
                      height: 350,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 115,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 88, 90, 149),
                          borderRadius: BorderRadius.circular(20)),
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _baykusButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        ProjectConst().baykus,
        width: 100,
      ),
    );
  }
}
