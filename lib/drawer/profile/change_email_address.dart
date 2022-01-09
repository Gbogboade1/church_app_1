import 'package:flutter/material.dart';

class ChangeEmailAddr extends StatefulWidget {
  @override
  _ChangeEmailAddrState createState() => _ChangeEmailAddrState();
}

class _ChangeEmailAddrState extends State<ChangeEmailAddr> {
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
              Icons.mail,
              size: 64,
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "Change Email address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(height: 32),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter new email address",
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
                  Text("Proceed"),
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
