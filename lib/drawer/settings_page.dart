import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool grantLocation = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Location"),
              trailing: Switch(
                value: grantLocation,
                onChanged: (v) {
                  setState(() {
                    grantLocation = v;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
