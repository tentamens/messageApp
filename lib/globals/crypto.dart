import 'dart:convert';
import 'dart:io';
import 'package:cryptography/cryptography.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:messaging_app/globals/apiHandler.dart';
import 'package:messaging_app/globals/fireBaseMessaging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string_generator/random_string_generator.dart';

List public = [];
List private = [];
String apnsToken = "";
String userId = "";
bool loaded = false;

class Crypto {
  void init() async {
    print("init");
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

    apnsToken = await FireBaseMessaging().initClientFirst();

    var fileDataJson = file.readAsStringSync();
    var fileData = jsonDecode(fileDataJson);
    public = fileData["public"] ?? [];
    private = fileData["private"] ?? [];
    userId = fileData["userId"] ?? "";
    apnsToken = fileData["apnsToken"] ?? "";
    print(userId);
    if (userId == "") {
      initNewClient();
    }
  }

  void initNewClient() async {
    print("init new client");
    userId = RandomStringGenerator(maxLength: 15, minLength: 10).generate();
    final algorithm = X25519();
    final keyPair = await algorithm.newKeyPair();
    final publicKey = await keyPair.extract();
    public = publicKey.bytes;
    private = await keyPair.extractPrivateKeyBytes();
    print(userId);
    saveFile();
  }

  void saveFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/cryptoStuff.json";
    File file = File(filePath);
    final fileData = {
      "public": public,
      "private": private,
      "userId": userId,
      "apnsToken": apnsToken
    };
    final saveData = jsonEncode(fileData);
    file.writeAsString(saveData);
  }

  Future<void> createFile(file) async {
    file.createSync();
    var fileData = {"public": "", "private": "", "userId": "", "apnsToken": ""};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  get getPublic => public;
  get getPrivate => private;
  get getUserId => userId;
}
