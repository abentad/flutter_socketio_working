import 'package:chatapp_socketio/components/widgets.dart';
import 'package:chatapp_socketio/controller/chat_controller.dart';
import 'package:chatapp_socketio/controller/user_controller.dart';
import 'package:chatapp_socketio/view/message_screen.dart';
import 'package:chatapp_socketio/view/user_select_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConversatoinsScreen extends StatelessWidget {
  ConversatoinsScreen({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserSelectScreen()));
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
                  child: Text('Chat', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: size.height * 0.04),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.black,
                          style: const TextStyle(fontSize: 18.0),
                          controller: _searchController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Search",
                            hintStyle: const TextStyle(fontSize: 16.0, color: Colors.grey),
                            suffixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Color(0xfff2f2f2))),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Color(0xfff2f2f2))),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Color(0xfff2f2f2))),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        margin: const EdgeInsets.only(left: 20.0),
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(Icons.person),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.conversations().length,
                    itemBuilder: (context, index) => ConversationWidget(
                      ontap: () {
                        Get.find<ChatController>().getMessages(controller.conversations()[index].id);
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => MessageScreen()));
                      },
                      size: size,
                      userName: Get.find<UserController>().currentUser!.sId.toString() == controller.conversations()[index].members[0].toString()
                          ? controller.conversations()[index].names.receiverName
                          : controller.conversations()[index].names.senderName,
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
