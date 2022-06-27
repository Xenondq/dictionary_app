import 'package:dictionary_app/core/model/translate_model.dart';
import 'package:vexana/vexana.dart';

abstract class ITranslateService {
  late final INetworkManager _networkManager;

  ITranslateService(INetworkManager networkManager)
      : _networkManager = networkManager;
  Future<List<TranslateModel>?> fetchAllWords();
}

class TranslateService extends ITranslateService {
  TranslateService(INetworkManager networkManager) : super(networkManager);

  Future<List<TranslateModel>?> fetchAllWords({String? query}) async {
    final String _myPath =
        "https://api.dictionaryapi.dev/api/v2/entries/en/$query";
    final response = await _networkManager
        .send<TranslateModel, List<TranslateModel>>(_myPath,
            parseModel: TranslateModel(), method: RequestType.GET);
    return response.data;
  }
}
