import 'dart:convert';
import 'package:dictionary_app/core/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;
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
String translated = "deneme";

class _TranslateWordState extends State<TranslateWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: containers(
            widths: MediaQuery.of(context).size.width,
            heights: MediaQuery.of(context).size.height,
            childs: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const BaykusPadding.all(),
                    child: _baykusButton(),
                  ),
                  _translateIcon(context),
                  Padding(
                    padding: const ManuelPadding.all(),
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
              ),
            )));
  }

  SizedBox _volumeButtonTurks(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.width * 0.1,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.volume_up_outlined)),
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
              color: const Color.fromARGB(255, 152, 138, 185),
              borderRadius: TranslateBoxRadius.all()),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.30,
          height: MediaQuery.of(context).size.width * 0.20,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 152, 138, 185),
              borderRadius: TranslateBoxRadius.all()),
          child:
              const Align(alignment: Alignment.bottomCenter, child: Text(ing)),
        ),
        SizedBox(
          height: 50,
          width: 180,
          child: TextField(
            onChanged: (text) async {
              const apiKey = "AIzaSyA2XB_TKanFvdEBwPC58zuY-KVUqA0zy6c";
              const to = 'es';
              final translation = await text.translate(
                from: 'auto',
                to: 'es',
              );
              final url = Uri.parse(
                  "https://translation.googleapis.com/language/translate/v2?q=$text&target=$to&key=$apiKey");
              final response = await http.post(url);
              if (response.statusCode == 200) {
                final body = json.decode(response.body);
                final translations = body['data']['translations'] as List;
                final translation = HtmlUnescape()
                    .convert(translations.first['translatedText']);
              }
              setState(() {
                translated = translation.text;
              });
            },
            maxLines: 1,
            decoration: const InputDecoration(
                hintText: "Kelime Giriniz",
                hintStyle: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  SizedBox _volumeButtonING(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.width * 0.1,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.volume_up_outlined)),
            Image.asset(sound),
          ]),
    );
  }

  Stack _ingStackwithContainer(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const OnlyTop.all(),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 152, 138, 185),
                borderRadius: TranslateBoxRadius.all()),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.08,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 152, 138, 185),
              borderRadius: TranslateBoxRadius.all()),
          child: Align(child: Text(translated)),
        ),
        const Padding(
          padding: OnlyTop.all(),
          child: SizedBox(
            height: 50,
            width: 180,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "Kelime Giriniz",
                  hintStyle: TextStyle(color: Colors.white)),
            ),
          ),
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
