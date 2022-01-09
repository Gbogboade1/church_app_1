import 'package:church/auth/auth_forgor_password.dart';
import 'package:flutter/material.dart';

class AuthLogIn extends StatefulWidget {
  @override
  _AuthLogInState createState() => _AuthLogInState();
}

class _AuthLogInState extends State<AuthLogIn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Welcome back",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 32,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Email Address",
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => AuthFogotPassword(),
                ),
              );
            },
            child: Text(
              "Forgot Password",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Log in"),
              ],
            ),
            shape: StadiumBorder(),
          ),
        ],
      ),
    );
  }
}
