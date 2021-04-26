import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maya/screens/screen.dart';
import '../widgets/widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatSection extends StatefulWidget {
  @override
  _ChatSectionState createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Theme.of(context).primaryColorLight,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: FlatMessageInputBox(
              roundedCorners: true,
              hintText: "Search",
              iconChoosen: Icon(
                Icons.search,
                size: 24.0,
                // color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          // FlatSectionHeader(
          //   title: "Moments",
          // ),
          Container(
            height: 108.0,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 16.0),
                  child: FlatAddStoryBtn(
                    onPressed: () {
                      print("Button Pressed");
                    },
                    // backgroundColor: Color(0xFFEC3F27),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                  onlineIndicator: true,
                  imageUrl:
                      'https://images.pexels.com/photos/3866555/pexels-photo-3866555.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                  onlineIndicator: false,
                  outlineColor: Color(0xFF262833).withOpacity(0.3),
                  imageUrl:
                      'https://images.pexels.com/photos/4618392/pexels-photo-4618392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                  onlineIndicator: false,
                  outlineColor: Color(0xFF262833).withOpacity(0.3),
                  imageUrl:
                      'https://images.pexels.com/photos/1261731/pexels-photo-1261731.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                  onlineIndicator: false,
                  imageUrl:
                      'https://images.pexels.com/photos/3699259/pexels-photo-3699259.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                  onlineIndicator: false,
                  outlineColor: Color(0xFF262833).withOpacity(0.3),
                  imageUrl:
                      'https://images.pexels.com/photos/3078831/pexels-photo-3078831.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                ),
                FlatProfileImage(
                  outlineIndicator: true,
                  onlineIndicator: false,
                  outlineColor: Color(0xFF262833).withOpacity(0.3),
                  imageUrl:
                      'https://images.pexels.com/photos/3142449/pexels-photo-3142449.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                ),
              ],
            ),
          ),
          FlatSectionHeader(
            title: "Marked Important",
          ),
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: FlatChatItem(
              profileImage: FlatProfileImage(
                onlineIndicator: true,
                imageUrl: 'https://pbs.twimg.com/media/Do9uXD2XsAA2h8W.jpg',
              ),
              name: "Aasha Upadhyay",
              message: "I will be waiting for you desperately.",
              multiLineMessage: false,
              onPressed: () {
                // Navigator.pushNamed(context, ChatPage.id);
                // print("pressed");
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ChatPage(),
                    ));
              },
              counter: FlatCounter(
                text: "9+",
              ),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Mute',
                color: Colors.green,
                icon: Icons.volume_off,
                onTap: () => print('Mute'),
              ),
              IconSlideAction(
                caption: 'Archive',
                color: Colors.blue,
                icon: Icons.archive,
                onTap: () => print('Archive'),
              ),
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => print('Delete'),
              ),
            ],
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              imageUrl: 'https://www.roshanparajuli.com.np/img/avatar.png',
              outlineIndicator: false,
              onlineIndicator: false,
            ),
            name: "Roshan Parajuli",
            message: ">> You're the father of this app?",
            multiLineMessage: false,
            onPressed: () {
              print("Clicked on Chat Item");
            },
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              onlineIndicator: true,
              imageUrl: 'https://avatars.githubusercontent.com/u/65444364?v=4',
            ),
            name: "Prakriti Regmi",
            message: ">> Why did you block me? 🥺",
            multiLineMessage: false,
            onPressed: () {
              // Navigator.pushNamed(context, ChatSection.id);
            },
          ),
          FlatSectionHeader(
            title: "Messages",
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              imageUrl:
                  'https://media-exp1.licdn.com/dms/image/C5103AQHhTLNffZIIZw/profile-displayphoto-shrink_200_200/0/1535424857346?e=1622678400&v=beta&t=_oO5GfohrSHMZHvaJmbkqEIG-xipsZqeEISV4uLFRwM',
              outlineIndicator: false,
              onlineIndicator: false,
            ),
            name: "Sachit Tandukar",
            message: "You got 99 on HCI!!!!",
            multiLineMessage: true,
            onPressed: () {
              print("Clicked on Chat Item");
            },
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              imageUrl:
                  'https://cdn.dribbble.com/users/134573/avatars/normal/b38eeeb89fdf66f0e22ee8f9c601e8aa.jpg?1598918000',
              outlineIndicator: false,
              onlineIndicator: true,
            ),
            name: "Pravash Karki",
            message: "Check out my videos on youtube.",
            multiLineMessage: true,
            onPressed: () {
              print("Clicked on Chat Item");
            },
            counter: FlatCounter(
              text: "1",
            ),
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              imageUrl:
                  'https://media-exp1.licdn.com/dms/image/C5103AQGYLaUo_1cM5Q/profile-displayphoto-shrink_200_200/0/1554446287995?e=1622073600&v=beta&t=I4WL-7bLNy3tehj8R36IPvZ78v0qdF2UAZOwo_KelTU',
              outlineIndicator: false,
              onlineIndicator: false,
            ),
            name: "Sachit Man Sherchan",
            message: "This application does look kinda cool.",
            multiLineMessage: true,
            onPressed: () {
              print("Clicked on Chat Item");
            },
          ),
          FlatChatItem(
            profileImage: FlatProfileImage(
              imageUrl: 'https://pbs.twimg.com/media/Eo7Z-FrVgAE_fUE.jpg',
              outlineIndicator: false,
              onlineIndicator: false,
            ),
            name: "Bijay Dangal",
            message: "Wassup bro? Timi pani dating app chalaidya amamama?",
            counter: FlatCounter(
              text: "3",
            ),
            // multiLineMessage: true,
            onPressed: () {
              print("Clicked on Chat Item");
            },
          ),
          FlatChatItem(),
          FlatChatItem(),
        ],
      ),
    );
  }
}
