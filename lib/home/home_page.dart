import 'dart:ui';

import 'package:church/auth/auth_page.dart';
import 'package:church/drawer/downloads_page.dart';
import 'package:church/drawer/inbox_page.dart';
import 'package:church/drawer/settings_page.dart';
import 'package:church/functiions.dart';
import 'package:church/home/audio_page.dart';
import 'package:church/home/books_page.dart';
import 'package:church/home/get_connected.dart';
import 'package:church/home/home_dashboard_page.dart';
import 'package:church/home/search_page.dart';
import 'package:church/home/video_page.dart';
import 'package:church/style/styles.dart';
import 'package:church/ui_items/goto_media_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<NavDrawerItem> drawerItemList = [];
  int selectedIndex = 0;
  String appBarTitle = "Home";
  bool isDrawer = false;
  Widget homeBody;

  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    buildDrawerItemList();
    homeBody = drawerItemList[0].page;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawer) {
          setState(() {
            print("back to home");
            homeBody = drawerItemList[0].page;
            isDrawer = false;
            appBarTitle = drawerItemList[0].title;
            return true;
          });
        } else {
          if (selectedIndex == 0) {
            print("Exit app............");
            return true;
          } else {
            setState(() {
              selectedIndex = 0;
                    pageController.jumpToPage(0);
            print("Exit app *****");
            return true;
            });
          }
          // print("Exit app");
          return false;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey.withOpacity(.1),
        appBar: AppBar(
          title: Text(
            appBarTitle,
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            GotoMediaIcon(),

            InkWell(
              onTap: (){
                setState(() {
                  homeBody = SearchPage();
                  isDrawer = true;
                  appBarTitle = "Search";
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top:8.0, bottom: 8, right: 8),
                child: Icon(CupertinoIcons.search),
              ),
            )
          ],
          backgroundColor: Colors.black,
        ),
        drawer: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: Drawer(
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                child: buildDrawer(),
              ),
            ),
          ),
        ),
        body: homeBody,
        bottomNavigationBar: isDrawer
            ? null
            : BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    pageController.jumpToPage(index);
                    switch (index) {
                      case 0:
                        appBarTitle = "Home";
                        break;
                      case 1:
                        appBarTitle = "Books";
                        // isDrawer = true;
                        break;
                      case 2:
                        appBarTitle = "Audio";
                        // isDrawer = true;
                        break;
                      case 3:
                        appBarTitle = "Videos";
                        // isDrawer = true;
                        break;
                      case 4:
                        appBarTitle = "Get Connected";
                        // isDrawer = true;
                        break;
                      default:
                    }
                  });
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white70,
                items: [
                  bnbItem(activeIcon: CupertinoIcons.home, title: "Home"),
                  bnbItem(activeIcon: CupertinoIcons.book, title: "Books"),
                  bnbItem(
                      activeIcon: CupertinoIcons.double_music_note,
                      title: "Audios"),
                  bnbItem(
                      activeIcon: CupertinoIcons.fullscreen, title: "Videos"),
                  bnbItem(activeIcon: Icons.list, title: "Get Connected"),
                ],
              ),
      ),
    );
  }

  Widget buildHomeWidget() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      // itemCount: 5,
      children: <Widget>[
        HomeDashboard(),
        BooksPage(),
        AudioPage(),
        VideoPage(),
        GetConnectedPage()
      ],
    );
  }

  Widget buildDrawer() {
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildLogInCard(),
              ),
              // verticalSpace(),
              Container(
                height: .5,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
            ],
          ),
          verticalSpace(),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Wrap(
              children: List.generate(
                drawerItemList.length,
                (index) => buildDrawerItem(drawerItemList[index]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildLogInCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) =>
                // ProfilePage(
                //   profile: Profile(
                //     firstName: "Gbogboade",
                //     lastName: "Ayomide",
                //     emailAddr: "gbogboadeayomide@gmail.com",
                //   ),
                // ),
                AuthPage(),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.white.withOpacity(.3),
            shape: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Log in",
            style: TextStyle(
                color: Colors.grey,
                // fontSize: 24,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  buildDrawerItem(NavDrawerItem item) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          setState(() {
            print("Update home body");
            if (item == drawerItemList[0]) {
              isDrawer = false;
            } else {
              isDrawer = true;
            }
            appBarTitle = item.title;
            homeBody = item.page;
            Navigator.pop(context);
          });
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(
                item.icon,
                color: Colors.white,
              ),
            ),
            horizontalSpace(width: 16),
            Text(
              item.title,
              style: Styles.normalTextStyle
            )
          ],
        ),
      ),
    );
  }

  buildDrawerItemList() {
    drawerItemList.add(
      NavDrawerItem(
        title: "The Church",
        icon: CupertinoIcons.home,
        page: buildHomeWidget(),
      ),
    );
    drawerItemList.add(
      NavDrawerItem(
        title: "My Library",
        icon: CupertinoIcons.folder,
        page: DownloadsPage(),
      ),
    );
    drawerItemList.add(
      NavDrawerItem(
        title: "Inbox",
        icon: CupertinoIcons.mail,
        page: InboxPage(),
      ),
    );
    drawerItemList.add(
      NavDrawerItem(
        title: "Settings",
        icon: CupertinoIcons.settings,
        page: SettingsPage(),
      ),
    );
  }

  bnbItem({IconData activeIcon, String title}) {
    return BottomNavigationBarItem(
      icon: Icon(
        activeIcon,
      ),
      activeIcon: Icon(
        activeIcon,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}

class NavDrawerItem {
  final String title;
  final IconData icon;
  final Widget page;

  NavDrawerItem({
    @required this.title,
    @required this.icon,
    @required this.page,
  });
}
