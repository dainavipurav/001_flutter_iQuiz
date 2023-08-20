import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:i_quiz/core/load_json.dart';
import 'package:i_quiz/services/quiz_list/data.dart';
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

  Future<void> fetchData() async {
    try {
      log.fine("-------------Start fetching data from firebase-------------");

      // Get a reference to the Firestore collection
      CollectionReference quizTypes =
          FirebaseFirestore.instance.collection('quiz_types');

      // Get the documents in the collection
      QuerySnapshot querySnapshot = await quizTypes.get();

      // Loop through the documents and access data
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        var dataFromFireStoreDB = doc.data();

        log.fine(
            "Response : $dataFromFireStoreDB \nResponse Type : ${dataFromFireStoreDB.runtimeType}");

        quizListResponse.value = QuizListResponseDto.fromJson(
            jsonDecode(jsonEncode(dataFromFireStoreDB)));

        log.fine("Response to Json : ${quizListResponse.value.toJson()}");
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    log.fine("-------------End fetching data from firebase-------------");
  }
}
