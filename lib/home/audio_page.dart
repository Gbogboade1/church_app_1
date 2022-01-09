import 'package:church/home/audio_single_page.dart';
import 'package:church/home/podcast_view_page.dart';
import 'package:church/ui_items/church_item.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  var bodyIndex;
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  bool isScrolling = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {});
    // getList();
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
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
                // Card(
                //     color: Colors.grey.withOpacity(.1),
                //     child: Center(child: Text("No data found")));
              } else {
                List<ChurchItem> churchItemList = snapshot.data;
                return Stack(
                  children: <Widget>[
                    ListView(
                      controller: scrollController,
                      children: <Widget>[
                        Image.asset("images/img1.jpg"),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(8.0),
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16.0,
                              crossAxisSpacing: 16.0,
                              childAspectRatio: 1,
                            ),
                            children: List<Widget>.generate(
                              churchItemList.length,
                              (index) {
                                ChurchItem item = churchItemList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) => AudioSinglePage(title: item.title,)));
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 2),
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset(item.imageUrl),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(item.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .apply(color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: Visibility(
                        visible: isScrolling,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 3),
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: Icon(Icons.arrow_downward),
                          ),
                        ),
                      ),
                    )
                  ],
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
