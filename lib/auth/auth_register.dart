import 'package:flutter/material.dart';

class AuthRegister extends StatefulWidget {
  @override
  _AuthRegisterState createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Create a new account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 32,
          ),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "First name",
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Last Name",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
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
            decoration: InputDecoration(
              hintText: "Create Password",
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Confirm Password",
            ),
          ),
          SizedBox(height: 16),
          // RichText(
          //   textAlign: TextAlign.center,
          //   text: TextSpan(
          //     style: TextStyle(color: Colors.grey),

          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                "By clicking on Create account you agree to ",
                style: TextStyle(color: Colors.grey),
              ),
              InkWell(
                onTap: (){
                  //TODO("Term of use link")
                },
                              child: Text(
                  "Terms of Use ",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Text(
                "and ",
                style: TextStyle(color: Colors.grey),
              ),
              InkWell(
                onTap: (){
                  //TODO("Privacy Policy link")
                },
                              child: Text(
                  "Privacy Policy",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),

          //   ),
          // ),
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
                Text("Create account"),
              ],
            ),
            shape: StadiumBorder(),
          ),
        ],
      ),
    );
  }
}
