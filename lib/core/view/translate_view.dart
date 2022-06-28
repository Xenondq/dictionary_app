import 'package:dictionary_app/core/model/translate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/translate_cubit.dart';
import '../widgets/loading_widget.dart';
import '../widgets/searched_widget.dart';

class TranslateMainView extends StatelessWidget {
  TranslateMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TranslateCubit>();
    return BlocListener<TranslateCubit, TranslateState>(
      listener: (context, state) {
        if (state is WordSearchedState && state.words != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchedWidget(state.words)));
        }
      },
      bloc: cubit,
      child: Scaffold(
        appBar: AppBar(),
        body: cubit.state is WordSearchingState
            ? LoadingWidget()
            : Form(
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
      ),
    );
  }
}
