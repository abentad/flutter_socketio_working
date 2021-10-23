import 'package:chatapp_socketio/components/widgets.dart';
import 'package:chatapp_socketio/view/message_screen.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('Messages', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: size.height * 0.04),
              ConversationWidget(
                size: size,
                userName: "Darrell Steward",
                message: "Thank you so much!",
                time: "2 min ago",
                newMessagesNumber: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
