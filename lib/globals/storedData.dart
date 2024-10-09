import 'dart:convert';
import 'dart:io';

import 'package:messaging_app/globals/newMessageNotifer.dart';
import 'package:path_provider/path_provider.dart';

String name = "";
bool loaded = false;
late NewMessageNotifer messageNotifer;
List<Map> messages = [
  {"name": "Tentamens", "userId": "testing1", "unread": 0}
];

class StoredData {
  void load() async {
    if (loaded) {
      return;
    }
    loaded = true;
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/storedData.json";
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

  void saveFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/storedData.json";
    File file = File(filePath);
    final fileData = {'name': name, "messages": messages};
    final fileDataJson = jsonEncode(fileData);
    file.writeAsString(fileDataJson);
  }

  void moveSendToFront(String userID) {
    int unread = 0;
    String username = "Tentamens";
    for (var i in messages) {
      if (i["userId"] == userID) {
        username = i["name"];
        unread = i["unread"];
        messages.remove(i);
        break;
      }
    }
    messages.insert(0, {"name": username, "userId": userID, "unread": unread});
  }

  get getName => name;
  get getMessage => name;
  set setNewMessageNotifer(v) => messageNotifer = v;
  set setMessage(v) => messages = v;
  NewMessageNotifer get getNewMessageNotifer => messageNotifer;
}
