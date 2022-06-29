import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/translate_cubit.dart';
import '../model/translate_model.dart';
import '../widgets/loading_widget.dart';
import '../widgets/searched_widget.dart';

class TranslateMainView extends StatelessWidget {

  TranslateMainView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TranslateCubit>();
    return BlocBuilder<TranslateCubit, TranslateState>(
        builder: ((context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: Form(
          child: Column(children: [
            TextFormField(
              controller: cubit.wordQueryController,
            ),
            ElevatedButton(
                onPressed: () {
                  cubit.getWordSearched();
                },
                child: Text("Find")),
          ]),
        ),
      );
    }));
  }
}
