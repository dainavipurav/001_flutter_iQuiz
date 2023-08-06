import 'package:flutter/material.dart';
import 'package:i_quiz/components/i_quiz_appbar.dart';
import 'package:i_quiz/components/radio_list/radio_list.dart';
import 'package:i_quiz/services/quiz_list/quiz_list_response_dto.dart';

class QuizQuestionScreen extends StatefulWidget {
  final String quizTitle;
  const QuizQuestionScreen({Key? key, required this.quizTitle})
      : super(key: key);

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IQuizAppBar.iQuizAppBar(
        title: widget.quizTitle,
      ),
      body: QuizRadioList(
        quizListResponseDto: QuizListResponseDto(data: []),
      ),
    );
  }
}
