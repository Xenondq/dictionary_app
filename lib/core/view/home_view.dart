import 'package:dictionary_app/core/cubit/translate_cubit.dart';
import 'package:dictionary_app/core/view/deneme.dart';
import 'package:dictionary_app/core/view/translate_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../project/border/project_border.dart';
import '../widgets/background_gradient.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

const baykus = "assets/k_logo.png";
const baslatText = "Başlat";
String ceviriText = "Çeviri";
String hello = "hello";
const kelimeAraText = "Kelime Ara";
const rastgeleKelimeText = "Rastgele  Kelimeler";
double top = 50;
double size = 200;
bool isTouched = false;
bool isTouched2 = false;
double kOpacityOne = 1;
double kOpacityZero = 0;
double kOneHund = 100;
double textFontsize = 18;

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        containers(
          widths: MediaQuery.of(context).size.width,
          heights: MediaQuery.of(context).size.height,
          childs: Stack(
            children: [
              Center(
                child: AnimatedOpacity(
                  opacity: isTouched2 ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 152, 138, 185),
                      borderRadius: ContainerBorderRadius.all(),
                    ),
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width * 0.57,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/second');
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: ButtonBorderRadius.all()),
                              child: Align(
                                child: Text(ceviriText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          _kelimeAraButton(),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          _rastgeleKelimeButton(),
                        ]),
                  ),
                ),
              ),
              _baslatButton(context),
              _baykusAnimated(context),
            ],
          ),
        )
      ],
    ));
  }

  Positioned _settingsButton(BuildContext context) {
    return Positioned(
        right: MediaQuery.of(context).size.width * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.01,
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: 35,
            )));
  }

  InkWell _kelimeAraButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.055,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: ButtonBorderRadius.all()),
        child: const Align(
          child: Text(kelimeAraText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }

  InkWell _rastgeleKelimeButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.055,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: ButtonBorderRadius.all()),
        child: const Text(rastgeleKelimeText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }

  Positioned _baslatButton(BuildContext context) {
    return Positioned(
      bottom: isTouched2 ? -100 : MediaQuery.of(context).size.height * 0.43,
      left: MediaQuery.of(context).size.width * 0.40,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000),
        opacity: isTouched ? kOpacityOne : kOpacityZero,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: ButtonBorderRadius.all())),
          child: Text(
            baslatText,
            style: TextStyle(fontSize: textFontsize),
          ),
          onPressed: () {
            setState(() {
              isTouched2 = !isTouched2;
              kOpacityOne = 0;
            });
          },
        ),
      ),
    );
  }

  AnimatedPositioned _baykusAnimated(BuildContext context) {
    return AnimatedPositioned(
        top: isTouched2
            ? MediaQuery.of(context).size.height * 0.08
            : MediaQuery.of(context).size.height * 0.3,
        left: isTouched
            ? MediaQuery.of(context).size.width * 0.38
            : isTouched2
                ? MediaQuery.of(context).size.width * 0.26
                : MediaQuery.of(context).size.width * 0.26,
        duration: const Duration(milliseconds: 500),
        child: InkWell(
            onTap: () {
              setState(() {
                isTouched = true;
                size = !isTouched2 ? kOneHund : kOneHund;
              });
            },
            child: AnimatedSize(
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  baykus,
                  width: size,
                ))));
  }
}
