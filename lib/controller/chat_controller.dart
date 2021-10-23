import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatController extends GetxController {
  final List<String> _messages = [];
  List<String> get messages => _messages;

  ChatController() {
    connectToServer();
  }

  //connection working
  late Socket _socket;
  Socket get socket => _socket;

  //
  void connectToServer() {
    try {
      _socket = io('http://192.168.8.137:3000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      _socket.connect();
      _socket.on('connect', (_) => print('connect: ${_socket.id}'));
      _socket.on('receive-message', (message) {
        _messages.add(message);
        print('message: $message');
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void sendMessage(String message) {
    _socket.emit('send-message', message);
  }
}
