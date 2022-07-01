import 'package:translator/translator.dart';
import '../model/translate_model.dart';
import '../service/translate_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslateCubit extends Cubit<TranslateState> {
  final TranslateService _translateService;
  TranslateCubit(this._translateService) : super(NoTranslateState());

  final wordQueryController = TextEditingController();

  Future getWordSearched({required String text}) async {
    final translator = GoogleTranslator();
    var translate = await translator.translate(text, from: 'en', to: 'tr');
    final words = await _translateService.fetchAllWords(query: text);
    if (words != null) {
      emit(WordSearchingState(words, translate.text));
    }
  }
  Future getpage() async {
    emit(NoTranslateState());
  }
}

abstract class TranslateState {}

class NoTranslateState extends TranslateState {}

class WordSearchingState extends TranslateState {
  final List<TranslateModel> words;
  final String translatewords;

  WordSearchingState(this.words, this.translatewords);
}

class WordSearchedState extends TranslateState {}
