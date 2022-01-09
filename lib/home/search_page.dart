import 'package:church/ui_items/search_result.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          buildSearchBar(),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 16, right: 16),
            child: ListView(
              children: List.generate(
                13,
                (indeex) {
                  SearchResult s = SearchResult(
                    imageUrl: "images/img1.jpg",
                    title: "The Lord of My Heart in the time of distress.",
                    subTitle: "The Church",
                  );
                  return buildSearchResult(s);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  buildSearchResult(SearchResult s) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Image.asset(
            s.imageUrl,
            width: 60,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  s.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .apply(fontSizeFactor: 0.9),
                ),
                SizedBox(height: 4),
                Text(
                  s.subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .apply(fontSizeFactor: 1.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Icon(Icons.search, color: Colors.black.withOpacity(.5)),
                    SizedBox(width: 4),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search media....."),
                      ),
                    ),
                    SizedBox(width: 4),
                    Visibility(
                      visible: true,
                      // maintainSize: true,
                      child: Icon(Icons.cancel,
                          color: Colors.black.withOpacity(.5)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Text("Cancel")
        ],
      ),
    );
  }
}
