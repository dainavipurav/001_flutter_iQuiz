import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import '../utils/constant.dart';

class FormFields {
  static final log = Logger(Constant.formFieldsConstant);

  static Widget dropDownField({
    required String label,
    required String hint,
    required List<String> items,
    Function(String?)? onChanged,
    String? Function(String?)? validator,
    String? value,
    bool isEditable = true,
    bool enabled = true,
  }) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.all(15.0),
          // fillColor: theme.colorScheme.background,
          filled: true,
          enabled: enabled,
        ),
        validator: enabled ? validator : null,
        items: items.map(
          (String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items.contains("|") ? items.split("|")[1] : items),
            );
          },
        ).toList(),
        // style: theme.textTheme.subtitle1!.copyWith(fontSize: 14),
        isDense: true,
        icon: const Icon(Icons.arrow_drop_down_outlined),
        onChanged: enabled && isEditable ? onChanged : null,
        value: value == "" ? null : value,
      ),
    );
  }

  static Widget textField(
      {TextEditingController? textEditingController,
      String label = "",
      String hintText = "",
      TextInputType? keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters,
      Function(String?)? onSaved,
      Function(String?)? onChanged,
      String? Function(String?)? validator,
      int? maxLength,
      int? maxLines,
      bool enabled = true,
      bool isEditable = true,
      TextCapitalization textCapitalization = TextCapitalization.none}) {
    return TextFormField(
      // style: enabled && isEditable
      //     ? theme.textTheme.subtitle1!.copyWith(fontSize: 14)
      //     : theme.textTheme.subtitle1!.copyWith(
      //         fontSize: 14,
      //         color: Colors.grey,
      //       ),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.done,
      controller: textEditingController,
      readOnly: !isEditable,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        enabled: enabled,
        labelText: label,
        hintText: hintText,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.all(15.0),
        // fillColor: theme.colorScheme.background,
        filled: true,
        counterText: "",
      ),
      onSaved: onSaved,
      maxLines: maxLines,
      enabled: enabled,
      onChanged: onChanged,
      maxLength: maxLength,
      validator: enabled ? validator : null,
    );
  }
}
