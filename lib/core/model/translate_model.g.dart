// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateModel _$TranslateModelFromJson(Map<String, dynamic> json) =>
    TranslateModel(
      word: json['word'] as String?,
      phonetic: json['phonetic'] as String?,
      phonetics: (json['phonetics'] as List<dynamic>?)
          ?.map((e) => Phonetics.fromJson(e as Map<String, dynamic>))
          .toList(),
      origin: json['origin'] as String?,
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meanings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TranslateModelToJson(TranslateModel instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetic': instance.phonetic,
      'phonetics': instance.phonetics,
      'origin': instance.origin,
      'meanings': instance.meanings,
    };

Phonetics _$PhoneticsFromJson(Map<String, dynamic> json) => Phonetics(
      text: json['text'] as String?,
      audio: json['audio'] as String?,
    );

Map<String, dynamic> _$PhoneticsToJson(Phonetics instance) => <String, dynamic>{
      'text': instance.text,
      'audio': instance.audio,
    };

Meanings _$MeaningsFromJson(Map<String, dynamic> json) => Meanings(
      partOfSpeech: json['partOfSpeech'] as String?,
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definitions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeaningsToJson(Meanings instance) => <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
    };

Definitions _$DefinitionsFromJson(Map<String, dynamic> json) => Definitions(
      definition: json['definition'] as String?,
      example: json['example'] as String?,
    );

Map<String, dynamic> _$DefinitionsToJson(Definitions instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'example': instance.example,
    };
