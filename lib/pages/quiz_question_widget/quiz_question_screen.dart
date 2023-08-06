import 'package:flutter/material.dart';
import 'package:i_quiz/components/i_quiz_appbar.dart';

class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IQuizAppBar.iQuizAppBar(
        title: "Quiz Title",
      ),
    );
  }
}
