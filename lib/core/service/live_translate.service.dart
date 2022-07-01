import 'dart:convert';
import 'package:dictionary_app/core/service/translate_service.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';
import 'package:translator/translator.dart';

class LiveTransLateService {
  Future<Translation> translateServices(
      {required String? text, required String to, required String from}) async {
    const apiKey = "";
    to = to;
    final translation = await text!.translate(from: from, to: to);
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
