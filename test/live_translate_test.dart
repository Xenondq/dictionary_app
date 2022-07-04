import 'package:dictionary_app/core/service/translate_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ITranslateService translateService;
  setUp(() {
    translateService = TranslateService(NetworkManager(
        options: BaseOptions(
            baseUrl:
                "https://translation.googleapis.com/language/translate/v2?q=hello&target=tr&key=")));
  });

  test('Live Translate Test', () async {
    final response = await translateService.translateServices();

    expect(response, isNotEmpty);
  });
}
