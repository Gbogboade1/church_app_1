import 'package:church/drawer/profile/change_email_address.dart';
import 'package:church/drawer/profile/change_password.dart';
import 'package:church/ui_items/goto_media_icon.dart';
import 'package:church/ui_items/profile_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;

  const ProfilePage({Key key, this.profile}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 16, color: Colors.black);
    List<Widget> body = [
      Wrap(
        // shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 16,
              bottom: 8,
            ),
            child: Text(
              "Account".toUpperCase(),
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                SizedBox(width: 8),
                Flexible(
                  child: TextField(
                    controller:
                        TextEditingController(text: widget.profile.firstName),
                    decoration: InputDecoration(
                        hintText: "Enter First name", border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 8,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  child: TextField(
                    controller:
                        TextEditingController(text: widget.profile.lastName),
                    decoration: InputDecoration(
                        hintText: "Enter First name", border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => ChangeEmailAddr(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.profile.emailAddr,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => ChangePassword(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Change Password",
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: Row(
              children: <Widget>[
                // Icon(Icons.transit_enterexit),
                Text(
                  "",
                  style: textStyle,
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.transit_enterexit,
                  color: Colors.grey,
                ),
                SizedBox(width: 8),
                Text(
                  "Log out",
                  style: textStyle,
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height * .5)
    ];
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              elevation: 8,
              actions: <Widget>[GotoMediaIcon()],
              backgroundColor: Colors.blueGrey[300],
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                title: Text(
                  "${widget.profile.firstName} ${widget.profile.lastName}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                // centerTitle: true,
                background: Center(
                  child: Card(
                    color: Colors.black.withOpacity(.3),
                    shape: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        "${widget.profile.firstName.substring(0, 1)} ${widget.profile.lastName.substring(0, 1)}",
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                body,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRow(IconData icon, String title) {
    TextStyle textStyle = TextStyle(fontSize: 16, color: Colors.black);
    return Wrap(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 8,
            bottom: 8,
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.transit_enterexit),
              Text(
                "Log out",
                style: textStyle,
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
