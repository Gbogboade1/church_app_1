
import 'package:church/home/video_single_page.dart';
import 'package:church/ui_items/church_item.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  final int bodyIndex;

  const VideoPage({Key key, this.bodyIndex}) : super(key: key);
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
        await Future.delayed(Duration(seconds: 3));
        getList();
      },
      child: StreamBuilder<List<ChurchItem>>(
          stream: getList(),
          key: _key,
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot == null) {
              return Card(child: Center(child: Text("Unable to fetch data")));
            } else {
              if (snapshot.data == null) {
                return Card(
                  color: Colors.grey.withOpacity(.1),
                  child: Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
                );
              } else {
                List<ChurchItem> churchItemList = snapshot.data;
                return ListView(
                  children: List<Widget>.generate(
                    churchItemList.length,
                    (index) {
                      ChurchItem item = churchItemList[index];
                      // print("${item.date}");
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => VideoSinglePage(
                                bodyIndex: 12,
                              ),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  item.imageUrl,
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.center,
                                  height:200//MediaQuery.of(context).size.height * 3,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .apply(
                                        fontSizeFactor: .7,
                                        color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }
          }),
    );
  }

  Stream<List<ChurchItem>> getList() async* {
    List<ChurchItem> churchItemList = [];
    ChurchItem c = ChurchItem(
      imageUrl: "images/img1.jpg",
      title:
          "Leadership RoundTable Through rhe COVID-19 Crisis",
      subTitle: "Josh Patterson, Matt Chandler, and Summer Vision-Berger",
      date: "June 10, 2020",
      isDownloaded: false,
      videoUrl: "url",
      audioUrl: "url",
      summaryText:
          "In thi new (Virtual) Leadership Roundtable, Josh Patterson, Matt Chandler, and Summer Vision talks about how they are navigated the COVID 19 crisis as laders in the church.",
    );

    for (var i = 0; i < 15; i++) {
      await Future.delayed(Duration(milliseconds: 600));
      churchItemList.add(c);
      yield churchItemList;
    }
    churchItemList = List.generate(20, (i) => c);
  }
}
