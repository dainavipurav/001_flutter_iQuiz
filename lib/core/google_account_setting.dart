import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:i_quiz/utils/dialog.dart';

class GoogleAccountSetting {
  static void logout() {
    IQuizApplicationDialog.confirmation(
      Get.context!,
      barrierDismissible: true,
      negativeButtonText: "No",
      message: "Are you sure you want to signout?",
      onWillPop: true,
      positiveButtonText: "Yes",
      title: "Sign Out?",
      onPressedPositiveButton: () async {
        Navigator.pop(Get.context!);
        await GoogleSignIn().signOut();
        FirebaseAuth.instance.signOut();
      },
    );
  }
}
