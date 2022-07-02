import 'package:dictionary_app/core/view/translate_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';
import '../cubit/translate_cubit.dart';

class TranslateMainView extends StatefulWidget {
  final List<Translation>? translated;
  const TranslateMainView({Key? key, this.translated}) : super(key: key);

  @override
  State<TranslateMainView> createState() => _TranslateMainViewState();
}

class _TranslateMainViewState extends State<TranslateMainView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TranslateCubit>();
    return BlocBuilder<TranslateCubit, TranslateState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            child: Column(children: [
              TextFormField(
                controller: cubit.wordQueryController,
                onChanged: (texts) async {
                  final response = await cubit.getWordSearched();
                },
              ),
            ]),
          ),
        );
      },
    );
  }
}
