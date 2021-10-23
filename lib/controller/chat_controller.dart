import 'package:chatapp_socketio/constants.dart';
import 'package:chatapp_socketio/model/conversation.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatController extends GetxController {
  final List<String> _messages = [];
  List<String> get messages => _messages;
  final List<Conversation> _conversations = [];
  List<Conversation> conversations() => _conversations;

  ChatController() {
    connectToServer();
  }

  //connection working
  late Socket _socket;
  Socket get socket => _socket;

  //
  void connectToServer() {
    try {
      _socket = io(kbaseUrl, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      _socket.connect();
      _socket.on('connect', (_) => print('connect: ${_socket.id}'));
      _socket.on('receive-message', (message) {
        _messages.add(message);
        print('message: $message');
        update();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void getConversations(String userId) async {
    Dio _dio = Dio(
      BaseOptions(
        baseUrl: kbaseUrl,
        connectTimeout: 10000,
        receiveTimeout: 100000,
        responseType: ResponseType.json,
      ),
    );
    try {
      final response = await _dio.get('/api/conversation?userId=$userId');
      if (response.statusCode == 200) {
        print('worked nice');
        for (final conv in response.data) {
          _conversations.add(Conversation.fromJson(conv));
        }
        print('${_conversations.length} conversations has been added to list');
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void sendMessage(String message) {
    _socket.emit('send-message', message);
  }
}
