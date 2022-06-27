import 'package:dictionary_app/core/service/translate_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ITranslateService translateService;
  setUp(() {
    translateService = TranslateService(NetworkManager(
        options: BaseOptions(
            baseUrl: "https://api.dictionaryapi.dev/api/v2/entries/en/hello")));
  });

  test('Sample TEst', () async {
    final response = await translateService.fetchAllWords();

    expect(response, isNotEmpty);
  });
}
