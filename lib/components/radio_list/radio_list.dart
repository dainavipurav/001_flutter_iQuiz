import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_quiz/services/quiz_list/quiz_list_response_dto.dart';

import '../../services/quiz_list/data.dart';
import '../../theme/theme.dart';

class QuizRadioList extends StatefulWidget {
  final QuizListResponseDto quizListResponseDto;
  const QuizRadioList({Key? key, required this.quizListResponseDto})
      : super(key: key);

  @override
  State<QuizRadioList> createState() => _QuizRadioListState();
}

class _QuizRadioListState extends State<QuizRadioList> {
  int? selectedIndex;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.quizListResponseDto.data!.length,
      itemBuilder: (context, index) {
        Data data = widget.quizListResponseDto.data![index];
        return listItem(data.name ?? "", index, data.icon ?? "");
      },
    );
  }

  Widget listItem(String title, int index, String icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(
              "assets/icons/$icon.svg",
              alignment: Alignment.center,
            ),
          ),
        ),
        trailing: selectedIndex == index
            ? InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selectedIndex = null;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: theme.colorScheme.background,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      "assets/icons/close.svg",
                      alignment: Alignment.center,
                      color: AppColors.warning,
                    ),
                  ),
                ),
              )
            : null,
        title: Text(title),
        tileColor: selectedIndex == index
            ? theme.colorScheme.primary
            : theme.colorScheme.background,
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        selected: selectedIndex == index,
        selectedTileColor: theme.colorScheme.secondary.withOpacity(0.8),
      ),
    );
  }
}
