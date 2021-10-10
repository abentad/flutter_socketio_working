import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    //connect to server
    connectToServer();
  }

  //connection working
  late Socket socket;
  void connectToServer() {
    try {
      socket = io('http://10.0.2.2:3000', <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket.connect();
      socket.on('connect', (_) => print('connect: ${socket.id}'));
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Socket.io Chat app",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.08),
              TextFormField(
                cursorColor: Colors.black,
                style: const TextStyle(fontSize: 18.0, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: const TextStyle(fontSize: 14.0, color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  filled: true,
                  fillColor: const Color(0xfff2f2f2),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.white, width: 1.0)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.white, width: 1.0)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Colors.white, width: 1.0)),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                minWidth: double.infinity,
                height: 50.0,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
