import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as soi;

late soi.Socket socket;

List<String> newMessageData = ["", ""];

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
        print("hello world");
        return;
      }
      ;
      print("pning from messaage");
      newMessageData[1] = data["text"];
      newMessage();
      print(newMessageData);

      print(data);
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
    final data = {"from": "testing", "to": "testing1", "text": messageData};
    socket.emit("pm", data);
  }

  List get getNewMessageData => newMessageData;
}
