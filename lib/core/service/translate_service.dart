import 'package:dictionary_app/core/model/translate_model.dart';
import 'package:translator/translator.dart';
import 'package:vexana/vexana.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';

abstract class ITranslateService {
  late final INetworkManager _networkManager;

  ITranslateService(INetworkManager networkManager)
      : _networkManager = networkManager;
  Future<List<TranslateModel>?> fetchAllWords();
  Future<Translation?> translateServices();
}

class TranslateService extends ITranslateService {
  TranslateService(INetworkManager networkManager) : super(networkManager);

  Future<List<TranslateModel>?> fetchAllWords({String? query}) async {
    final String _myPath =
        "https://api.dictionaryapi.dev/api/v2/entries/en/$query";
    final response =
        await _networkManager.send<TranslateModel, List<TranslateModel>?>(
      _myPath,
      parseModel: TranslateModel(),
      method: RequestType.GET,
    );
    return response.data;
  }

  Future<Translation?> translateServices(
      {String? text, String? to, String? from}) async {
    const apiKey = "AIzaSyA2XB_TKanFvdEBwPC58zuY-KVUqA0zy6c";
    to = to;
    final translation = await text?.translate(from: from!, to: to!);
    final url = Uri.parse(
        "https://translation.googleapis.com/language/translate/v2?q=$text&target=$to&key=$apiKey");
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final translations = body['data']['translations'] as List;
      final translation =
          HtmlUnescape().convert(translations.first['translatedText']);
    }
    return translation;
  }
}
