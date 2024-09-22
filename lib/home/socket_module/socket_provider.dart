import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class SocketProvider extends ChangeNotifier {
  List<String>? messageList = [];
  WebSocketChannel? channel;
  bool _isConnected = false;
  final TextEditingController messageController = TextEditingController();

  // Getter for connection status
  bool get isConnected => _isConnected;

  SocketProvider() {
    _connectWebSocket();
  }

  void _connectWebSocket() {
    channel = IOWebSocketChannel.connect("ws://echo.websocket.org");
    _isConnected = true;
    notifyListeners();
  }

  void sendMessage(String message) {
    if (_isConnected && channel != null) {
      channel!.sink.add(message);
      messageList?.add(message);
      messageController.clear();
    } else {
      debugPrint('WebSocket is not connected');
    }
  }

  @override
  void dispose() {
    if (_isConnected && channel != null) {
      channel!.sink.close();
      _isConnected = false;
      notifyListeners();
    }
    super.dispose();
  }
}
