import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../model/translate_model.dart';

class SearchedWidget extends StatefulWidget {
  final List<TranslateModel>? words;
  SearchedWidget(this.words);

  @override
  State<SearchedWidget> createState() => _SearchedWidgetState();
}

class _SearchedWidgetState extends State<SearchedWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration();
  Duration position = Duration();
  bool playing = false;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.words![index].word.toString()),
              leading: InkWell(
                  onTap: () async {
                    if (playing) {
                      await audioPlayer.pause();
                    } else {
                      String url =
                          widget.words![index].phonetics![index].audio!;
                      await audioPlayer.play(UrlSource(url));
                    }
                  },
                  child: Icon(Icons.play_arrow)),
            );
          }),
    );
  }
}
