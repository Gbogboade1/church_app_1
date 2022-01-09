import 'package:church/functiions.dart';
import 'package:church/style/styles.dart';
import 'package:church/ui_items/goto_media_icon.dart';
import 'package:flutter/material.dart';

class EventsViewPage extends StatefulWidget {
  @override
  _EventsViewPageState createState() => _EventsViewPageState();
}

class _EventsViewPageState extends State<EventsViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("Deeper Young Adults"),
        actions: <Widget>[
          GotoMediaIcon(),
          horizontalSpace(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.share),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(0),
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Deeper Young Adults",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "Saturday, July 28, 12:30 - 200am",
                          style: Styles.normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(),
                  Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                    size: 32,
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Date/Time",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  horizontalSpace(),
                  Expanded(
                    child: Text(
                      "Saturday, July 28, 12:30 - 200am",
                      softWrap: true,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Online url",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  horizontalSpace(),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "bit,.ly.exp",
                        softWrap: true,
                        style: TextStyle(color: Colors.blue[900], fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Age",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  horizontalSpace(),
                  Expanded(
                    child: Text(
                      "16 - 20",
                      softWrap: true,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventsModel {
  final String title;
  final String date;

  EventsModel({
    this.title,
    this.date,
  });
}
