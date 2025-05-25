import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class WsService {
  late WebSocketChannel _channel;

  void connect(String token, String roomName) {
    print("connecting to ws");
    _channel = WebSocketChannel.connect(
      Uri.parse("ws://192.168.250.95:8001/ws/chat/$roomName/?token=$token"),
    );
    print("connected");
  }

  Stream get stream {
    try {
      return _channel.stream;
    } catch (e) {
      print("error getting stream");
      return Stream.empty();
    }
  }

  void sendMessage(String message) {
    print("sending message");
    print(message);
    _channel.sink.add(jsonEncode({"message": message, "type": "chat_message"}));
  }

  void disconnect() {
    print("disconnecting");
    _channel.sink.close();
  }
}
