// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

class ContactRepository {
  Future<String> sendMessage({
    required String email,
    required String message,
  }) async {
    try {
      await html.HttpRequest.postFormData(
        "https://formbold.com/s/6r0pr",
        {
          "email": email,
          "message": message,
        },
      );
      return "";
    } catch (e) {
      return "An error occured";
    }
  }
}
