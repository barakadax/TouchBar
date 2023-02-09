import 'dart:convert';
import 'package:flutter/services.dart';

class JsonReader {
  Future<dynamic> readJson(String file) async {
    var data = await rootBundle.loadString(file);
    return await json.decode(data);
  }
}
