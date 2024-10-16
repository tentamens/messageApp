import 'package:flutter/material.dart';
import 'package:messaging_app/globals/messageFileHandler.dart';
import 'package:messaging_app/globals/storedData.dart';
import 'package:socket_io_client/socket_io_client.dart' as soi;

late soi.Socket socket;

List newMessageData = ["", false];
String currentOpenId = "";

class NewMessageNotifer extends ChangeNotifier {
  void newMessage() {
    notifyListeners();
  }

  void connectToSever() {
    print("connecting or trying to ");
    socket = soi.io("http://10.0.0.19:5000/", {
      'transports': ['websocket'],
      "autoConnect": false
    });
    socket.connect();

    socket.onConnect((_) {
      print("you connected!");
      socket.emit("setupConnection", {"userId": "testing"});
    });

    socket.on('message', (data) {
      if (data.runtimeType == List) {
        return;
      }

      MessageFileHandler()
          .addUserMessage(data["from"]["userId"], [data["text"], false]);
      StoredData().moveSendToFront(data["from"]["userId"]);

      if (currentOpenId != data["from"]["userId"]) {
        return;
      }
      newMessageData[0] = data["text"];
      newMessageData[1] = true;
      newMessage();
    });

    socket.on('pm', (data) {
      print("pning from pm");
    });

    socket.on("setupConnection", (data) {
      print("hello world");
      print(data);
    });
  }

  void registerClient() {
    final data = {"name": "hiI", "userId": "testing", "pubKey": []};
    socket.emit("register", data);
  }

  void sendMessage(String messageData) {
    final data = {
      "from": {"userId": "testing", "name": "Tentamens"},
      "to": "testing1",
      "text": messageData
    };
    socket.emit("pm", data);
  }

  void saveOwnMessage(String userId, String messageData) {
    print("hello world");
    newMessageData[0] = messageData;
    newMessageData[1] = false;

    notifyListeners();
    MessageFileHandler().addUserMessage(userId, [messageData, true]);
  }

  get getCurrentOpenId => currentOpenId;
  set setCurrentOpenId(v) => currentOpenId = v;
  List get getNewMessageData => newMessageData;
}
