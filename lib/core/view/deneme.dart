import 'package:dictionary_app/core/cubit/translate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

class Deneme extends StatefulWidget {
  final List<Translation>? translate;
  Deneme({Key? key, this.translate}) : super(key: key);

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TranslateCubit>();
    return BlocBuilder<TranslateCubit, TranslateState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(children: [
            BlocBuilder<TranslateCubit, TranslateState>(
              builder: (context, state) {
                return TextField(
                  controller: cubit.wordQueryController,
                  onChanged: (text) async {},
                );
              },
            ),
          ]),
        );
      },
    );
  }
}
