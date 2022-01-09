import 'package:flutter/material.dart';

class SociaMediaPage extends StatefulWidget {
  @override
  _SociaMediaPageState createState() => _SociaMediaPageState();
}

class _SociaMediaPageState extends State<SociaMediaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Card(
                      child: ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text("Instagram"),
            ),
          ),
          Card(
                      child: ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text("Facebook"),
            ),
          ),
          Card(
                      child: ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text("Twitter"),
            ),
          ),
        ],
      ),
    );
  }
}
