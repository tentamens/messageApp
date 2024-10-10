import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

bool loaded = false;
Map messageData = {};

class MessageFileHandler {
  void loadFile() async {
    if (loaded) {
      return;
    }
    loaded = true;
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/storedMessages.json";
    File file = File(filePath);
    if (!file.existsSync()) {
      await createFile(file);
    }

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);

    messageData = fileData["messageData"];
    print(messageData);
  }

  void addUserMessage(String userid, List newMessage) {
    if (!messageData.containsKey(userid)) {
      messageData[userid] = {"name": "hello", "pubkey": [], "messages": []};
    }
    messageData[userid]["messages"].add(newMessage);
    saveFile();
  }

  void addNewUser(String userId, String name, List pubkey) {
    messageData[userId] = {"name": name, "pubkey": pubkey, "messages": []};
  }

  List getUserMessages(String userId) {
    print(messageData);
    print(userId);
    if (!messageData.containsKey(userId)) {
      print("none found");
      return [];
    }
    print(messageData[userId]["messages"][1].runtimeType);
    return messageData[userId]["messages"];
  }

  Future<void> createFile(file) async {
    file.createSync();
    var fileData = {"messageData": {}};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  void saveFile() async {
    print(messageData);
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/storedMessages.json";
    File file = File(filePath);
    final fileData = {"messageData": messageData};
    final saveData = jsonEncode(fileData);
    file.writeAsString(saveData);
  }
}
