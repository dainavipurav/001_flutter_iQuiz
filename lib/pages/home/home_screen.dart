import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:i_quiz/components/i_quiz_appbar.dart';
import 'package:i_quiz/components/radio_list/radio_list.dart';
import 'package:i_quiz/core/google_account_setting.dart';
import 'package:i_quiz/pages/home/home_screen_controller.dart';
import 'package:i_quiz/routes.dart';
import 'package:i_quiz/utils/enums.dart';
import 'package:logging/logging.dart';

class HomeScreen extends StatefulWidget {
  final User loggedInUserDetails;

  const HomeScreen({Key? key, required this.loggedInUserDetails})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final log = Logger("Home Screen");
  HomeScreenController xController = Get.put(HomeScreenController());
  late ThemeData theme;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    xController.initializeQuizList();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      appBar: IQuizAppBar.iQuizAppBar(
          title: "Home",
          leadingWidget: IQuizAppBar.appBarLeading(AppBarLeadingType.PROFILE,
              widget.loggedInUserDetails.photoURL ?? ""),
          actions: [
            IconButton(
                onPressed: () {
                  GoogleAccountSetting.logout();
                },
                icon: Icon(Icons.logout))
          ]),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Welcome ${widget.loggedInUserDetails.displayName},",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Select below quiz",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  quizList(),
                  SizedBox(height: 20),
                ],
              ),
              startQuizButton(),
            ],
          ),
        );
      }),
    );
  }

  Widget quizList() {
    if (xController.quizListResponse.value.data != null &&
        xController.quizListResponse.value.data!.length != 0) {
      return QuizRadioList(
          quizListResponseDto: xController.quizListResponse.value);
    } else {
      return Text("No quiz available");
    }
  }

  Widget startQuizButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
          height: 60,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, IQuizRoutes.quizQuestionScreen);
              },
              child: Center(child: Text("Start Quiz"))),
        ),
      ),
    );
  }
}
