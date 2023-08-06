import 'dart:convert';

import 'package:flutter/services.dart';

class LoadJson {
  static Future<Map<String, dynamic>> loadData(String fileName) async {
    var data = await rootBundle.loadString("assets/jsons/$fileName.json");

    return jsonDecode(data) as Map<String, dynamic>;
  }
}
