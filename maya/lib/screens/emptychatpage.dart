import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maya/screens/screen.dart';
import '../widgets/widget.dart';

class EmptyChatPage extends StatefulWidget {
  String sth;
  EmptyChatPage(this.sth);

  @override
  _EmptyChatPageState createState() => _EmptyChatPageState(this.sth);
}

class _EmptyChatPageState extends State<EmptyChatPage> {
  String sth;
  _EmptyChatPageState(this.sth);

  @override
  Widget build(BuildContext context) {
    print(sth);

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
          title: sth,
          suffixWidget: FlatProfileImage(
            size: 35.0,
            onlineIndicator: true,
            imageUrl: "https://i.imgur.com/qjox2d6.png",
            onPressed: () {},
          ),
        ),
        children: [
          Center(
            child: Text(
              "Start a meaningful conversation with Prakriti.\n We wish you a very best luck.",
              textAlign: TextAlign.center,
            ),
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
