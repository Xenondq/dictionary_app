import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary_app/core/cubit/translate_cubit.dart';
import 'package:dictionary_app/core/widgets/background_gradient.dart';
import 'package:dictionary_app/core/widgets/loading_widget.dart';
import 'package:dictionary_app/project/border/project_border.dart';
import 'package:dictionary_app/project/const/project_const.dart';
import 'package:dictionary_app/project/padding/project_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';
import '../model/translate_model.dart';

class FindWordsView extends StatefulWidget {
  final List<TranslateModel>? words;
  final String? translatewords;
  const FindWordsView({Key? key, this.words, this.translatewords})
      : super(key: key);

  @override
  State<FindWordsView> createState() => _FindWordsViewState();
}

AudioPlayer audioPlayer = AudioPlayer();
bool playing = false;

class _FindWordsViewState extends State<FindWordsView> {
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TranslateCubit>();
    return BlocBuilder<TranslateCubit, TranslateState>(
      builder: (context, state) {
        return Scaffold(
          body: containers(
              widths: MediaQuery.of(context).size.width,
              heights: MediaQuery.of(context).size.height,
              childs: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: ManuelPadding.all(),
                      child: _baykusButton(context),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: _searchTextField(context, cubit),
                    ),
                    BlocBuilder<TranslateCubit, TranslateState>(
                      builder: (context, state) {
                        if (state is WordSearchingState) {
                          return Padding(
                            padding: OnlyTop.all(),
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.72,
                                decoration: BoxDecoration(
                                    borderRadius: ContainerBorderRadius.all(),
                                    color: Color.fromARGB(255, 192, 189, 189)),
                                child: ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: ((context, index) {
                                      return Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 150,
                                              child: Column(
                                                children: [
                                                  Text(state.words[index].word
                                                      .toString()),
                                                  Text(state
                                                      .words[index]
                                                      .phonetics![index + 1]
                                                      .text
                                                      .toString()),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          if (playing) {
                                                            await audioPlayer
                                                                .pause();
                                                          } else {
                                                            String url = state
                                                                    .words[
                                                                        index]
                                                                    .phonetics?[
                                                                        index]
                                                                    .audio ??
                                                                "";
                                                            await audioPlayer
                                                                .play(UrlSource(
                                                                    url));
                                                          }
                                                        },
                                                        child: const Icon(Icons
                                                            .volume_down_outlined),
                                                      ),
                                                      Image.asset(
                                                          ProjectConst().sound),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 150,
                                              width: 150,
                                              child: Column(
                                                children: [
                                                  Text(state.translatewords),
                                                  Text(""),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(Icons
                                                          .volume_down_outlined),
                                                      Image.asset(
                                                          ProjectConst().sound),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 350,
                                          height: 280,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Örnekler"),
                                                SizedBox(height: 5),
                                                Text(state
                                                    .words[index]
                                                    .meanings![index]
                                                    .partOfSpeech
                                                    .toString()),
                                                SizedBox(height: 10),
                                                Text(state
                                                        .words[index]
                                                        .meanings?[index]
                                                        .definitions?[index]
                                                        .definition ??
                                                    ""),
                                                SizedBox(height: 10),
                                                Text(state
                                                        .words[index]
                                                        .meanings?[index]
                                                        .definitions?[index]
                                                        .example ??
                                                    ""),
                                                SizedBox(height: 10),
                                                Text(state
                                                        .words[index]
                                                        .meanings?[index + 1]
                                                        .partOfSpeech ??
                                                    ""),
                                                SizedBox(height: 10),
                                                Text(state
                                                        .words[index]
                                                        .meanings?[index + 1]
                                                        .definitions?[index]
                                                        .definition ??
                                                    ""),
                                                SizedBox(height: 10),
                                                Text(state
                                                        .words[index]
                                                        .meanings?[index + 1]
                                                        .definitions?[index]
                                                        .example ??
                                                    ""),
                                              ]),
                                        ),
                                      ]);
                                    }))),
                          );
                        }
                        if (state is LoadingState) {
                          return const Padding(
                            padding: OnlyTop.all(),
                            child: LoadingWidget(),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  TextField _searchTextField(BuildContext context, TranslateCubit cubit) {
    return TextField(
      style: TextStyle(color: Theme.of(context).canvasColor),
      controller: cubit.wordQueryController,
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: IconButton(
              onPressed: () {
                cubit.getWordSearched();
              },
              icon: Icon(Icons.search, color: Theme.of(context).canvasColor)),
          filled: true,
          fillColor: const Color.fromARGB(255, 143, 124, 192),
          hintText: ProjectConst().kelimeGir,
          hintStyle: TextStyle(color: Theme.of(context).canvasColor)),
    );
  }

  InkWell _baykusButton(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(ProjectConst().baykus, width: 50));
  }
}
