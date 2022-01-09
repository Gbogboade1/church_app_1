import 'package:church/ui_items/church_inbox_item.dart';
import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<ChurchInboxItem> inboxList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<ChurchInboxItem>>(
            stream: getList(),
            builder: (context, snapshot) {
              if (snapshot == null) {
                return Card(child: Center(child: Text("Unable to fetch data")));
              } else {
                if (snapshot.data != null) {
                  return snapshot.data.length > 0
                      ? ListView(
                          children: List.generate(
                            snapshot.data.length,
                            (index) {
                              ChurchInboxItem item = snapshot.data[index];
                              return buildInboxItem(item);
                            },
                          ),
                        )
                      : Card(
                          child: Center(
                            child: Text("No data found"),
                          ),
                        );
                }
              }
              return Card(child: Center(child: Text("Unable to fetch data")));
            }),
      ),
    );
  }

  buildInboxItem(ChurchInboxItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                item.category,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Spacer(),
              Text(
                item.date,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 8),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Text(
                  item.title,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .apply(color: Colors.black, fontSizeFactor: 1.2),
                ),
              ),
              SizedBox(width: 8),
              Image.asset(item.imageUrl, width: 64),
            ],
          ),
        ],
      ),
    );
  }

  Stream<List<ChurchInboxItem>> getList() async* {
    var c = ChurchInboxItem(
      category: "General",
      date: "Jun 8",
      title:
          "Today on God's Big Story, Sean & K=Julie learn about how good and faithful God is.",
      imageUrl: "images/img1.jpg",
      content:
          "Today on God's Big Story, Sean & K=Julie learn about how good and faithful God is.",
    );

    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(milliseconds: 600));
      inboxList.add(c);
      yield inboxList;
    }
  }
}
