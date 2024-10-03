import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

String public = "";
String private = "";
String userId = "";

class Crypto {
  void init() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/cryptoStuff.json";
    File file = File(filePath);
    if (!file.existsSync()) {
      await createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);
    public = fileData["public"];
    private = fileData["private"];
    userId = fileData["userId"];
    if (public == "") {
      initNewClient();
    }
  }

  void initNewClient() {}

  Future<void> createFile(file) async {
    file.createSync();
    var fileData = {"public": "", "private": "", "userId": ""};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }
}
