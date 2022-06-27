import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'translate_model.g.dart';

@JsonSerializable()
class TranslateModel extends INetworkModel<TranslateModel?> {
  String? word;
  String? phonetic;
  List<Phonetics>? phonetics;
  String? origin;
  List<Meanings>? meanings;

  TranslateModel(
      {this.word, this.phonetic, this.phonetics, this.origin, this.meanings});

  factory TranslateModel.fromJson(Map<String, dynamic> json) {
    return _$TranslateModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TranslateModelToJson(this);
  }

  @override
  TranslateModel? fromJson(Map<String, dynamic> json) {
    return _$TranslateModelFromJson(json);
  }
}

@JsonSerializable()
class Phonetics {
  String? text;
  String? audio;

  Phonetics({this.text, this.audio});

  factory Phonetics.fromJson(Map<String, dynamic> json) {
    return _$PhoneticsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhoneticsToJson(this);
  }
}

@JsonSerializable()
class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;

  Meanings({this.partOfSpeech, this.definitions});

  factory Meanings.fromJson(Map<String, dynamic> json) {
    return _$MeaningsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MeaningsToJson(this);
  }
}

@JsonSerializable()
class Definitions {
  String? definition;
  String? example;

  Definitions({this.definition, this.example});

  factory Definitions.fromJson(Map<String, dynamic> json) {
    return _$DefinitionsFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$DefinitionsToJson(this);
  }
}
