import 'package:flutter/material.dart';

class SmallTable extends StatefulWidget {
  final List<String> columnList;
  final List<TableRow> rowsWidgetList;
  final double headingRowHeight;
  final int headingMaxLines;

  ///add this property if table columns are less than 4 to unscrollable table
  final Map<int, TableColumnWidth>? columnWidths;

  const SmallTable({
    Key? key,
    required this.columnList,
    required this.rowsWidgetList,
    this.headingRowHeight = 40,
    this.headingMaxLines = 2,
    this.columnWidths,
  }) : super(key: key);

  @override
  State<SmallTable> createState() => _SmallTableState();
}

class _SmallTableState extends State<SmallTable> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return widget.columnList.length <= 4 ? table() : scrollableTable();
  }

  Widget scrollableTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          border: TableBorder.all(
            color: theme.colorScheme.secondaryContainer.withOpacity(0.1),
          ),
          defaultColumnWidth: const IntrinsicColumnWidth(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            tableHeaders(),
            ...widget.rowsWidgetList,
          ],
        ),
      ),
    );
  }

  Widget table() {
    return Table(
      border: TableBorder.all(
        color: theme.colorScheme.secondaryContainer.withOpacity(0.1),
      ),
      defaultColumnWidth: const IntrinsicColumnWidth(),
      columnWidths: widget.columnWidths,
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        tableHeaders(),
        ...widget.rowsWidgetList,
      ],
    );
  }

  TableRow tableHeaders() {
    List<Widget> column = [];
    for (int i = 0; i < widget.columnList.length; i++) {
      column.add(
        tableHeaderCell(
          dataHeading: widget.columnList[i],
          color: theme.colorScheme.secondaryContainer.withOpacity(0.1),
        ),
      );
    }
    return TableRow(children: column);
  }

  Widget tableHeaderCell({required String dataHeading, Color? color}) {
    return Tooltip(
      message: dataHeading,
      child: Container(
        height: widget.headingRowHeight,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        color: theme.colorScheme.background.withOpacity(0.08),
        child: Text(
          dataHeading,
          textAlign: TextAlign.left,
          maxLines: widget.headingMaxLines,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.headline6!.copyWith(
            fontSize: 12,
            color: theme.colorScheme.tertiary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
