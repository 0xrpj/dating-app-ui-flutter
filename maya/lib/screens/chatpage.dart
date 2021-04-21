import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maya/screens/screen.dart';
import '../widgets/widget.dart';

class ChatPage extends StatefulWidget {
  static final String id = "ChatPage";

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatPageWrapper(
        backgroundColor: Colors.white,
        // scrollType: ScrollType.floatingHeader,
        reverseBodyList: true,
        header: FlatPageHeader(
          backgroundColor: Colors.white,
          prefixWidget: FlatActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: "Aasha Upadhyay",
          suffixWidget: FlatProfileImage(
            size: 35.0,
            onlineIndicator: true,
            imageUrl:
                'https://images.pexels.com/photos/3866555/pexels-photo-3866555.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
            onPressed: () {
              print("Clicked Profile Image");
            },
          ),
        ),
        children: [
          FlatChatMessage(
            message: "I will be waiting for you desperately.",
            messageType: MessageType.sent,
            showTime: true,
            time: "2 mins ago",
          ),
          FlatChatMessage(
            message: "I am so excited ki I can't even tell you.",
            messageType: MessageType.sent,
            showTime: false,
          ),
          FlatChatMessage(
            message:
                "I will be there on time. Don't go anywhere hai. Also, you can expect a surprise. 🥰",
            showTime: true,
            time: "2 mins ago",
          ),
          FlatChatMessage(message: "Sounds good to me."),
          FlatChatMessage(
            message: "My place? Tomorrow @ 8? ",
            messageType: MessageType.sent,
          ),
          FlatChatMessage(
            message: "cool cool cool. SO when are we meeting?",
            messageType: MessageType.sent,
          ),
          FlatChatMessage(
            message: "I need to discuss that to you in person.",
          ),
          FlatChatMessage(
            message: "A lot has happened since the last time we talked.",
          ),
          FlatChatMessage(
            message: "I had a lot to tell you.",
          ),
          FlatChatMessage(
            message:
                "Hello Aasha!!! You remembered me after suchha long time!!",
            messageType: MessageType.sent,
          ),
          FlatChatMessage(
            message: "Hi Roshan.",
          ),
        ],
        footer: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: FlatMessageInputBox(
            prefix: FlatActionButton(
              iconData: Icons.add,
              iconSize: 24.0,
            ),
            roundedCorners: true,
            suffix: FlatActionButton(
              iconData: Icons.image,
              iconSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
