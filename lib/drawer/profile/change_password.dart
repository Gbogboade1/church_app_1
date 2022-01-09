import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Icon(
              Icons.lock_open,
              size: 64,
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "Change your Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(height: 32),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter current password",
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter new password",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Change Password"),
                ],
              ),
              shape: StadiumBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
