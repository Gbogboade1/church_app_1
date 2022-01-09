import 'package:church/functiions.dart';
import 'package:church/home/audio_player_page.dart';
import 'package:church/home/media_player_page.dart';
import 'package:church/ui_items/church_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GotoMediaIcon extends StatelessWidget {
  final Color color;

  const GotoMediaIcon({Key key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushRoute(context, AudioPlayerPage());
        // ChurchItem c = ChurchItem(
        //   imageUrl: "images/img1.jpg",
        //   title: "Leadership RoundTable Through rhe COVID-19 Crisis",
        //   subTitle: "Josh Patterson, Matt Chandler, and Summer Vision-Berger",
        //   date: "June 10, 2020",
        //   isDownloaded: false,
        //   videoUrl: "url",
        //   audioUrl: "url",
        //   summaryText:
        //       "In thi new (Virtual) Leadership Roundtable, Josh Patterson, Matt Chandler, and Summer Vision talks about how they are navigated the COVID 19 crisis as laders in the church.",
        // );
        // print("${c.imageUrl}");
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => MediaPage(
        //       churchItem: c,
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.equalizer,
          color: color,
        ),
      ),
    );
  }
}
