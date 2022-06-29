import 'package:flutter/material.dart';

import '../../project/border/project_border.dart';
import '../../project/padding/project_padding.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

final baykus = "assets/k_logo.png";
final baslatText = "Başlat";
double top = 50;
double size = 200;
bool isTouched = false;
bool isTouched2 = false;
double butonopacity = 1;

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Center(
                  child: AnimatedOpacity(
                    opacity: isTouched2 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 350,
                      width: 250,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: ButtonBorderRadius.all())),
                              child: Text(
                                baslatText,
                                style: const TextStyle(fontSize: 30),
                              ),
                              onPressed: () {},
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: ButtonBorderRadius.all())),
                              child: Text(
                                baslatText,
                                style: const TextStyle(fontSize: 30),
                              ),
                              onPressed: () {},
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: ButtonBorderRadius.all())),
                              child: Text(
                                baslatText,
                                style: const TextStyle(fontSize: 30),
                              ),
                              onPressed: () {},
                            ),
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  bottom: isTouched2 ? -100 : 300,
                  left: 140,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: isTouched ? butonopacity : 0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: ButtonBorderRadius.all())),
                      child: const Text(
                        "deneme",
                        style: const TextStyle(fontSize: 30),
                      ),
                      onPressed: () {
                        setState(() {
                          isTouched2 = !isTouched2;
                          butonopacity = 0;
                        });
                      },
                    ),
                  ),
                ),
                AnimatedPositioned(
                    top: isTouched2 ? 50 : 180,
                    left: isTouched
                        ? MediaQuery.of(context).size.width * 0.39
                        : isTouched2
                            ? MediaQuery.of(context).size.width * 0.28
                            : MediaQuery.of(context).size.width * 0.28,
                    duration: const Duration(milliseconds: 500),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            isTouched = true;
                            size = !isTouched2 ? 100 : 100;
                          });
                        },
                        child: AnimatedSize(
                            duration: const Duration(milliseconds: 500),
                            child: Image.asset(
                              baykus,
                              width: size,
                            )))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*
 AnimatedPositioned(
                    top: isTouched ? 170 : 180,
                    left: isTouched
                        ? MediaQuery.of(context).size.width * 0.38
                        : MediaQuery.of(context).size.width * 0.26,
                    duration: const Duration(milliseconds: 500),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            top -= 200;
                            isTouched = !isTouched;
                            size = !isTouched ? 200 : 100;
                          });
                        },
                        child: AnimatedSize(
                            duration: const Duration(milliseconds: 500),
                            child: Image.asset(
                              baykus,
                              width: size,
                            )))),
                Positioned(
                  bottom: 300,
                  left: 150,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: isTouched ? 1.0 : 0.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: ButtonBorderRadius.all())),
                      child: Text(
                        baslatText,
                        style: const TextStyle(fontSize: 30),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),*/
