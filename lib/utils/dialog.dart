import 'package:flutter/material.dart';
import 'package:i_quiz/theme/theme.dart';

class IQuizApplicationDialog {
  static Future<bool?> confirmation(
    BuildContext context, {
    String message = "Message",
    String title = "iQuiz",
    String positiveButtonText = "YES",
    String negativeButtonText = "CANCEL",
    bool positiveButtonVisibility = true,
    bool negativeButtonVisibility = true,
    bool onWillPop = false,
    bool barrierDismissible = false,
    Function()? onPressedPositiveButton,
    Function()? onPressedNegativeButton,
  }) {
    ThemeData theme = Theme.of(context);
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => onWillPop,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            title: Text(
              title.toUpperCase(),
              style: theme.textTheme.headline2!.copyWith(
                color: AppColors.onTertiaryContainer.withOpacity(1.0),
                fontSize: 18.0,
                letterSpacing: 0.16,
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                message,
                style: theme.textTheme.headline2!.copyWith(
                  fontSize: 18.0,
                  color: AppColors.onTertiaryContainer.withOpacity(1.0),
                  letterSpacing: 0.16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            actions: [
              Visibility(
                visible: negativeButtonVisibility,
                child: TextButton(
                  onPressed: onPressedNegativeButton ??
                      () {
                        Navigator.pop(context, false);
                      },
                  child: Text(
                    negativeButtonText,
                    style: theme.textTheme.headline2!.copyWith(
                      color: theme.colorScheme.tertiary.withOpacity(1.0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.14,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: positiveButtonVisibility,
                child: TextButton(
                  onPressed: onPressedPositiveButton ??
                      () {
                        Navigator.pop(context, true);
                      },
                  child: Text(
                    positiveButtonText,
                    style: theme.textTheme.headline2!.copyWith(
                      color: AppColors.closed.withOpacity(1.0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
