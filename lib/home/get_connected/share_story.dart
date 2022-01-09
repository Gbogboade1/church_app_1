import 'package:church/functiions.dart';
import 'package:flutter/material.dart';

class ShareStory extends StatefulWidget {
  @override
  _ShareStoryState createState() => _ShareStoryState();
}

class _ShareStoryState extends State<ShareStory> {
  TextEditingController nameTextEditingController;
  TextEditingController phoneNumberTextEditingController;
  TextEditingController messageTextEditingController;
  TextEditingController emailTextEditingController;

  @override
  void initState() {
    super.initState();

    nameTextEditingController = TextEditingController();
    phoneNumberTextEditingController = TextEditingController();
    messageTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.3),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Share Story",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            CustomInputField(
              topLabel: "Name",
              hintText: "e.g. James John",
              bottomLabel: "",
              fieldSubmitted: (c) {},
              onChanged: (c) {
                refresh();
              },
              controller: nameTextEditingController,
              keyboardType: TextInputType.text,
            ),
            verticalSpace(),
            CustomInputField(
              topLabel: "Email Address",
              hintText: "e.g. scma@gmail.com",
              bottomLabel: "",
              fieldSubmitted: (c) {},
              onChanged: (c) {
                refresh();
              },
              controller: emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
            ),
            verticalSpace(),
            CustomInputField(
              topLabel: "Phone Number",
              hintText: "e.g. +2348012345678",
              bottomLabel: "",
              fieldSubmitted: (c) {},
              onChanged: (c) {
                refresh();
              },
              controller: phoneNumberTextEditingController,
              keyboardType: TextInputType.phone,
            ),
            verticalSpace(),
            Card(
              color: Colors.grey,
              child: SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                    controller: messageTextEditingController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
              ),
            ),
            verticalSpace(),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                color: Colors.blue,
                disabledColor: Colors.redAccent,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.near_me,
                      color: Colors.white,
                    ),
                    horizontalSpace(),
                    Text(
                      "Share",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                shape: StadiumBorder(),
                onPressed: canUpload()
                    ? () {
                        // uploadPrayer();
                      }
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }

  refresh() {
    setState(() {});
  }

  bool canUpload() {
    if (nameTextEditingController.text.isEmpty) return false;
    // if (phoneNumberTextEditingController.text.isEmpty) return false;
    if (messageTextEditingController.text.isEmpty) return false;
    // if (emailTextEditingController.text.isEmpty) return false;

    return true;
  }
}
