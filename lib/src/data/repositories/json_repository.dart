import 'dart:convert';

import 'package:flutter/services.dart';

class JsonRepository {
  Future<Map<String, dynamic>> getData(String path) async {
    final fileContents = await rootBundle.loadString(path);
    return jsonDecode(fileContents);
  }
}
