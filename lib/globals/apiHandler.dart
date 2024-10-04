import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:messaging_app/globals/crypto.dart';

class ApiHandler {
  Future<bool> sendMessagePublic(String message) async {
    final myPublicKey = Crypto().getPublic;
    final content = {"message": message, "pubKey": myPublicKey};
    final response =
        await http.post(Uri.parse("helloworld"), body: jsonEncode(content));
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }
}
