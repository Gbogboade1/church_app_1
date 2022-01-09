
import 'package:church/ui_items/church_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaPage extends StatefulWidget {
  final ChurchItem churchItem;

  const MediaPage({Key key, this.churchItem}) : super(key: key);
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int playerSpeed = 1;
  double sliderValue = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(CupertinoIcons.down_arrow),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: buildMediaImage(),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              children: <Widget>[
                Slider.adaptive(
                  min: 0,
                  max: 100,
                  value: sliderValue,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.withOpacity(0.7),
                  onChanged: (v) {
                    setState(() {
                      sliderValue = v;
                    });
                  },
                ),
                buildMediaIcons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showSnack() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.black,
              ),
              title: Text(
                "Share",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_downward,
                color: Colors.black,
              ),
              title: Text(
                "Download",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMediaImage() {
    return Center(
      child: Image.asset(
        widget.churchItem.imageUrl,
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * .5
            : MediaQuery.of(context).size.height,
      ),
    );
  }

  Widget buildMediaIcons() {
    return Row(
      // direction: Axis.horizontal,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Text(
            "${playerSpeed}X",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Spacer(),
        IconButton(
          splashColor: Colors.white,
          icon: Icon(
            Icons.replay_10,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 42,
          splashColor: Colors.white,
          icon: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          splashColor: Colors.white,
          icon: Icon(
            Icons.replay_10,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Spacer(),
        InkWell(
          splashColor: Colors.white,
          child: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onTap: () {
            showSnack();
          },
        ),
      ],
    );
  }
}
