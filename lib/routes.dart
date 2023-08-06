import 'package:flutter/material.dart';
import 'package:i_quiz/pages/quiz_question_widget/quiz_question_screen.dart';
import 'package:logging/logging.dart';

class IQuizRoutes {
  static final log = Logger('Empower Routes');

  static const initial = "/";
  static const home = "/home";
  static const quizQuestionScreen = "/quizQuestionScreen";

  static get(BuildContext context) {
    return {
      quizQuestionScreen: (context) => const QuizQuestionScreen(),
    };
  }
}
