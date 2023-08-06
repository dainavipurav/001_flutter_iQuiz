import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:i_quiz/components/i_quiz_appbar.dart';
import 'package:i_quiz/pages/sign_in/sign_in_controller.dart';
import 'package:logging/logging.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final log = Logger("Login / Sign up");
  final xController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IQuizAppBar.iQuizAppBar(title: "Login / Sign up"),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await xController.signInWithGoogle();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/google.svg",
                height: 24,
                width: 24,
              ),
              SizedBox(width: 10),
              Text("Sign in with Google"),
            ],
          ),
        ),
      ),
    );
  }
}
