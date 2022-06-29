import 'package:dictionary_app/core/view/translate_words.dart';
import 'package:flutter/material.dart';
import '../../project/border/project_border.dart';
import '../widgets/background_gradient.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

const baykus = "assets/k_logo.png";
const baslatText = "Başlat";
const ceviriText = "Çeviri";
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
            Stack(
              children: [
                _mainContainer(context),
                _baslatButton(context),
                _baykusAnimated(context),
              ],
            ),
            context,
          )
        ],
      ),
    );
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

  Center _mainContainer(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: isTouched2 ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 152, 138, 185),
            borderRadius: ContainerBorderRadius.all(),
          ),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width * 0.57,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _ceviriButton(),
            SizedBox(height: 10),
            _kelimeAraButton(),
            SizedBox(height: 10),
            _rastgeleKelimeButton(),
          ]),
        ),
      ),
    );
  }

  InkWell _ceviriButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TranslateWord(),
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.055,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: ButtonBorderRadius.all()),
        child: const Align(
          child: Text(ceviriText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
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
