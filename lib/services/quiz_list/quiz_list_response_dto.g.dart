// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizListResponseDto _$QuizListResponseDtoFromJson(Map<String, dynamic> json) =>
    QuizListResponseDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizListResponseDtoToJson(
        QuizListResponseDto instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
