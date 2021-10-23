import 'package:chatapp_socketio/components/widgets.dart';
import 'package:chatapp_socketio/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSelectScreen extends StatelessWidget {
  const UserSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: GetBuilder<UserController>(
            builder: (controller) => ListView.builder(
              itemCount: controller.allUsers.length,
              itemBuilder: (context, index) => ConversationWidget(
                ontap: () {},
                size: size,
                userName: controller.allUsers[index].name,
                message: "",
                time: "",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
