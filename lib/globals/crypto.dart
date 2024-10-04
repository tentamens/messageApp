import 'dart:convert';
import 'dart:io';
import 'package:cryptography/cryptography.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string_generator/random_string_generator.dart';

List public = [];
List private = [];
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

  void initNewClient() async {
    userId = RandomStringGenerator(maxLength: 15, minLength: 10).generate();
    final algorithm = X25519();
    final keyPair = await algorithm.newKeyPair();
    final publicKey = await keyPair.extract();
    public = publicKey.bytes;
    private = await keyPair.extractPrivateKeyBytes();
    saveFile();
  }

  void saveFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String filePath = "${appDir.path}/cryptoStuff.json";
    File file = File(filePath);
    final fileData = {"public": public, "private": private, "userId": userId};
    final saveData = jsonEncode(fileData);
    file.writeAsString(saveData);
  }

  Future<void> createFile(file) async {
    file.createSync();
    var fileData = {"public": "", "private": "", "userId": ""};
    var jsonFileData = jsonEncode(fileData);
    await file.writeAsString(jsonFileData);
  }

  get getPublic => public;
  get getPrivate => private;
  get getUserId => userId;
}
