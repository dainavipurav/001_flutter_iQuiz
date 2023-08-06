import 'package:i_quiz/services/quiz_list/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'quiz_list_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizListResponseDto {
  List<Data>? data;

  QuizListResponseDto({this.data});

  factory QuizListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$QuizListResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuizListResponseDtoToJson(this);
}
