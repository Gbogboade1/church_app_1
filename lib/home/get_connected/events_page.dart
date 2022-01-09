import 'package:church/functiions.dart';
import 'package:church/home/get_connected/events_view_page.dart';
import 'package:church/style/styles.dart';
import 'package:flutter/material.dart';

class UpcommingEvents extends StatefulWidget {
  @override
  _UpcommingEventsState createState() => _UpcommingEventsState();
}

class _UpcommingEventsState extends State<UpcommingEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Events"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:16.0),
        child: ListView(
          children: List.generate(10, (index) {
            EventsModel event =
                EventsModel(title: "Deeper Youth tribe", date: "Jun\n12");
            return InkWell(
              onTap: (){
                pushRoute(context, EventsViewPage());
              },
              child: buildEventTile(event));
          }),
        ),
      ),
    );
  }

 Widget buildEventTile(EventsModel event) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            horizontalSpace(),
            Column(
              children: <Widget>[
                Text("Jun", style: Styles.smallTextStyle,),
                Text("23", style: Styles.largeTextStyle,),
              ],
            ),
            horizontalSpace(width: 16),
            Expanded(child: Text("Deeper life group", style: Styles.normalBoldTextStyle,)),
          ],
        ),
        verticalSpace(),
        Container(
          height: 1,
          color: Colors.grey,
        ),
        verticalSpace()
      ],
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
