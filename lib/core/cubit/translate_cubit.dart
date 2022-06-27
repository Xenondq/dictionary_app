import '../model/translate_model.dart';
import '../service/translate_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslateCubit extends Cubit<TranslateState> {
  final TranslateService _translateService;
  TranslateCubit(this._translateService) : super(NoTranslateState());

  final wordQueryController = TextEditingController();

  Future getWordSearched() async {
    emit(WordSearchingState());
    final words =
        await _translateService.fetchAllWords(query: wordQueryController.text);
    if (words != null) {
      emit(WordSearchedState(words));
    }
  }
}

abstract class TranslateState {}

class NoTranslateState extends TranslateState {}

class WordSearchingState extends TranslateState {}

class WordSearchedState extends TranslateState {
  final List<TranslateModel> words;

  WordSearchedState(this.words);
}
