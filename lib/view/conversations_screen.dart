import 'package:chatapp_socketio/components/widgets.dart';
import 'package:chatapp_socketio/controller/chat_controller.dart';
import 'package:chatapp_socketio/view/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConversatoinsScreen extends StatelessWidget {
  const ConversatoinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: GetBuilder<ChatController>(
            builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.02),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Messages', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: size.height * 0.04),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.conversations().length,
                    itemBuilder: (context, index) => ConversationWidget(
                      size: size,
                      userName: controller.conversations()[index].members[0],
                      message: "Thank you so much",
                      time: DateFormat('E kk:mm').format(controller.conversations()[index].updatedAt),
                      newMessagesNumber: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
