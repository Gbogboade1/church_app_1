import 'package:church/auth/auth_page.dart';
import 'package:church/drawer/downloads_page.dart';
import 'package:church/functiions.dart';
import 'package:church/home/dashboard_pages/counselling_page.dart';
import 'package:church/home/dashboard_pages/library_page.dart';
import 'package:church/home/dashboard_pages/prayer_request_page.dart';
import 'package:church/ui_items/body_item.dart';
import 'package:church/ui_items/body_list_item.dart';
import 'package:church/ui_items/stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    List<BodyItem> bodyItemList = [
      BodyItem(
        color: Colors.orange,
        icon: CupertinoIcons.news,
        title: "I'm New Here",
        page: AuthPage(),
      ),
      BodyItem(
        color: Colors.deepOrange,
        icon: CupertinoIcons.heart,
        title: "Prayer Requests",
        page: PrayerRequestPage(),
      ),
      BodyItem(
        color: Colors.blue,
        icon: CupertinoIcons.person,
        title: "Meet Counsellor",
        page: CounsellingPage(),
      ),
      BodyItem(
        color: Colors.red,
        icon: Icons.folder_open,
        title: "My Library",
        page: LibraryPage(),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          ImagesStepper(),
          Wrap(
            children: List.generate(bodyItemList.length, (index) {
              BodyItem item = bodyItemList[index];
              return InkWell(
                onTap: (){
                  pushRoute(context, item.page);
                },
                child: BodyItemTile(item:item));
            }),
          )
        ],
      ),
    );
  }
}

