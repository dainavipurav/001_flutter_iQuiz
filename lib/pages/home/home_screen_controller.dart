import 'package:get/get.dart';
import 'package:i_quiz/core/load_json.dart';
import 'package:i_quiz/services/quiz_list/quiz_list_response_dto.dart';
import 'package:logging/logging.dart';

class HomeScreenController extends GetxController {
  final log = Logger("Home Screen Controller");

  RxString? selectedQuiz;

  Rx<QuizListResponseDto> quizListResponse = QuizListResponseDto().obs;

  initializeQuizList() async {
    Map<String, dynamic> data = await LoadJson.loadData("quiz_list");

    log.finest(
        "message Quiz response : $data\nResponse type : ${data.runtimeType}");

    quizListResponse.value = QuizListResponseDto.fromJson(data);
  }
}
