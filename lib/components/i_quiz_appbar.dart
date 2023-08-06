import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_quiz/utils/enums.dart';
import 'package:logging/logging.dart';

class IQuizAppBar {
  static final log = Logger("Appbar Widgets");

  static AppBar iQuizAppBar(
      {String title = "iQuiz", Widget? leadingWidget, List<Widget>? actions}) {
    return AppBar(
      actions: actions,
      title: appBarTitle(title),
      leading: leadingWidget,
    );
  }

  static Widget appBarTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(title),
    );
  }

  static Widget appBarLeading(AppBarLeadingType type, String imageUrl) {
    switch (type) {
      case AppBarLeadingType.PROFILE:
        return _profileImage(imageUrl);
      case AppBarLeadingType.BACK:
        return Icon(Icons.arrow_back);
      case AppBarLeadingType.NONE:
        return SizedBox();
    }
  }

  static Widget _profileImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
      child: CircleAvatar(
        backgroundImage: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            log.fine("Loading error builder");
            return SvgPicture.asset("assets/icons/user_image_placeholder.svg");
          },
          loadingBuilder: (context, child, loadingProgress) {
            return CircularProgressIndicator();
          },
        ).image,
      ),
    );
  }
}
