import 'package:flutter/material.dart';

class TableDataCell extends StatelessWidget {
  final String data;
  final Color? color;
  final AlignmentGeometry? alignment;
  const TableDataCell(
      {Key? key, required this.data, this.color, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Tooltip(
      message: data,
      child: Container(
        height: 30,
        color: color,
        alignment: alignment ?? Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Text(
          data,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyText2!.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.tertiary,
          ),
        ),
      ),
    );
  }
}
