import 'package:chatapp_socketio/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ChatController>(
          builder: (controller) => Column(
            children: [
              SizedBox(height: size.height * 0.02),
              const Text(
                "Socket.io Chat app",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(controller.socket.id.toString()),
                    subtitle: Text(controller.messages[index]),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.08),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      cursorColor: Colors.black,
                      style: const TextStyle(fontSize: 18.0, color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: "Message",
                        hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                        filled: true,
                        fillColor: Color(0xfff2f2f2),
                        enabledBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                        focusedBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10.0)), borderSide: BorderSide(color: Colors.white, width: 1.0)),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      controller.sendMessage(_messageController.text);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 11.0),
                      decoration: const BoxDecoration(),
                      child: const Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
