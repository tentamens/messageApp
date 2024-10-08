import 'dart:convert';
import 'dart:io';

import 'package:messaging_app/globals/newMessageNotifer.dart';
import 'package:path_provider/path_provider.dart';

String name = "";
bool loaded = false;
late NewMessageNotifer messageNotifer;

class StoredData {
  void load() async {
    if (loaded) {
      return;
    }
    loaded = true;
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/cryptoStuff.json";
    File file = File(filePath);
    if (!file.existsSync()) {
      await createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);
    name = fileData["name"] ?? "";
  }

  Future<void> createFile(file) async {
    file.createSync();
    var fileData = {"name": "Anonymous"};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  get getName => name;
  set setNewMessageNotifer(v) => messageNotifer = v;
  NewMessageNotifer get getNewMessageNotifer => messageNotifer;
}
