import 'package:chatapp_socketio/constants.dart';
import 'package:chatapp_socketio/controller/chat_controller.dart';
import 'package:chatapp_socketio/model/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  User? _currentUser;
  User? get currentUser => _currentUser;
  final List<User> _allUsers = [];
  List<User> get allUsers => _allUsers;

  UserController() {
    getAllUsers();
  }

  Future<bool> signUp(String username) async {
    print('signup called');
    Dio _dio = Dio(BaseOptions(baseUrl: kbaseUrl, connectTimeout: 20000, receiveTimeout: 100000, responseType: ResponseType.json));
    try {
      final response = await _dio.post('/api/user', data: {"name": username});
      print(response.statusCode);
      if (response.statusCode == 201) {
        print('worked nice');
        _currentUser = User.fromJson(response.data);
        update();
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> login(String username) async {
    print('login called');
    Dio _dio = Dio(BaseOptions(baseUrl: kbaseUrl, connectTimeout: 20000, receiveTimeout: 100000, responseType: ResponseType.json));
    try {
      final response = await _dio.get('/api/user?name=$username');
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('worked nice');
        _currentUser = User.fromJson(response.data[0]);
        Get.find<ChatController>().getConversations(_currentUser!.sId);
        update();
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> getAllUsers() async {
    print('getting all users');
    Dio _dio = Dio(BaseOptions(baseUrl: kbaseUrl, connectTimeout: 20000, receiveTimeout: 100000, responseType: ResponseType.json));
    try {
      final response = await _dio.get('/api/user/all');
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('worked nice');
        for (final user in response.data) {
          _allUsers.add(User.fromJson(user));
        }
        update();
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
