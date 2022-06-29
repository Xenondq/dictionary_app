import 'package:flutter/material.dart';

import '../../project/border/project_border.dart';
import '../../project/padding/project_padding.dart';

class TranslateWord extends StatefulWidget {
  const TranslateWord({Key? key}) : super(key: key);

  @override
  State<TranslateWord> createState() => _TranslateWordState();
}

const baykus = "assets/k_logo.png";
const sound = "assets/k_sound.png";
const String ing = "İngilizce";
const String turks = "Türkçe";
double baykusSize = 100;

class _TranslateWordState extends State<TranslateWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: BaykusPadding.all(),
                  child: _baykusButton(),
                ),
                _translateIcon(context),
                Padding(
                  padding: ManuelPadding.all(),
                  child: Column(children: [
                    _ingStackwithContainer(context),
                    _volumeButtonING(context),
                  ]),
                ),
                Column(children: [
                  _turksStackwithContainer(context),
                  _volumeButtonTurks(context),
                ]),
              ],
            )));
  }

  Container _volumeButtonTurks(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.width * 0.1,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.volume_up_outlined)),
            Image.asset(sound),
          ]),
    );
  }

  Stack _turksStackwithContainer(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 152, 138, 185),
              borderRadius: TranslateBoxRadius.all()),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.30,
          height: MediaQuery.of(context).size.width * 0.20,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 152, 138, 185),
              borderRadius: TranslateBoxRadius.all()),
          child: const Align(
              alignment: Alignment.bottomCenter, child: const Text(turks)),
        ),
      ],
    );
  }

  Container _volumeButtonING(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.width * 0.1,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.volume_up_outlined)),
            Image.asset(sound),
          ]),
    );
  }

  Stack _ingStackwithContainer(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: OnlyTop.all(),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 152, 138, 185),
                borderRadius: TranslateBoxRadius.all()),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.08,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 152, 138, 185),
              borderRadius: TranslateBoxRadius.all()),
          child: const Align(child: const Text(ing)),
        ),
      ],
    );
  }

  Icon _translateIcon(BuildContext context) {
    return Icon(
      Icons.translate,
      size: 45,
      color: Theme.of(context).canvasColor,
    );
  }

  InkWell _baykusButton() {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(baykus, width: baykusSize));
  }
}
