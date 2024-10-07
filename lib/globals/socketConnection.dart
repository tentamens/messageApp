import 'package:socket_io_client/socket_io_client.dart' as soi;

late soi.Socket socket;

class SocketConnection {
  void connectToSever() {
    print("connecting or trying to ");
    socket = soi.io("http://10.0.0.19:5000/", {
      'transports': ['websocket'],
      "autoConnect": false
    });
    socket.connect();

    socket.onConnect((_) {
      print("you connected!");
    });

    socket.on('message', (data) {
      print(data);
    });

    socket.on('pm', (data) {
      print(data);
    });
  }

  void registerClient() {
    final data = {"name": "hiI", "userId": "testing", "pubKey": []};
    socket.emit("register", data);
  }

  void sendMessage(String messageData) {
    final data = {"from": "hiI", "to": "testing1", "text": messageData};
  }
}
