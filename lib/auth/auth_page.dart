import 'package:church/auth/auth_register.dart';
import 'package:church/auth/auth_sign_in.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int tabId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,

        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      // color: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        if (tabId != 0) {
                          setState(() {
                            tabId = 0;
                          });
                        }
                      },
                      child: buildTabIndicator("Log in", tabId == 0),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: InkWell(
                        onTap: () {
                          if (tabId == 0) {
                            setState(() {
                              tabId = 1;
                            });
                          }
                        },
                        child: buildTabIndicator("Sign up", tabId == 1)),
                  )
                ],
              ),
            ),
            IndexedStack(
              index: tabId,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(seconds: 3),
                  child: AuthLogIn(),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 3),
                  child: AuthRegister(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTabIndicator(String text, bool isActive) {
    return Wrap(
      // crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(color: isActive ? Colors.black : Colors.grey),
        ),
        Divider(
          thickness: 1,
          color: isActive ? Colors.black : Colors.grey,
        )
      ],
    );
  }
}
