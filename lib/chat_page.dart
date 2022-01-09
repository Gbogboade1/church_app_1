import 'package:church/functiions.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String name;
  final String imgurl;

  const ChatPage({Key key, this.name, this.imgurl}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        titleSpacing: -15.0,
        title: Row(
          children: <Widget>[
            InkWell(
              child: Row(
                children: <Widget>[
                  CircleAvatar(backgroundImage: NetworkImage(widget.imgurl)),
                  horizontalSpace(),
                  Text(
                    widget.name,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
        actions: <Widget>[
          // Icon(Icons.videocam),
          // Icon(Icons.call),
          // Icon(Icons.more_vert)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/8f/ba/cb/8fbacbd464e996966eb9d4a6b7a9c21e.jpg"),
                fit: BoxFit.fitWidth)),
        child: Column(
          children: <Widget>[
            Flexible(child: Container()),
            Row(children: <Widget>[
              Flexible(
                  child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                child: Theme(
                  data: Theme.of(context).copyWith(primaryColor: Colors.white),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.insert_emoticon, color: Colors.grey),
                      hintText: "Type a message",
                      suffixIcon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(30.0)),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                    onPressed: null),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ])
          ],
        ),
      ),
    ); //modified
  }
}
