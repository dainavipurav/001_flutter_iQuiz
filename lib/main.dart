import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_quiz/core/logging.dart';
import 'package:i_quiz/pages/home/home_screen.dart';
import 'package:i_quiz/pages/sign_in/sign_in_screen.dart';
import 'package:i_quiz/routes.dart';

import 'theme/theme.dart';
import 'utils/constant.dart';

void main() async {
  AppLogging.enableLogger();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Constant.projectApiKey,
      appId: Constant.androidAppId,
      messagingSenderId: Constant.projectNumber,
      projectId: Constant.projectId,
    ),
  );
  runApp(IQuizApp());
}

class IQuizApp extends StatelessWidget {
  IQuizApp({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.light,
      navigatorKey: navigatorKey,
      routes: IQuizRoutes.get(context),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return SignInScreen();
            } else {
              return HomeScreen(
                loggedInUserDetails: snapshot.data!,
              );
            }
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}