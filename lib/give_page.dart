import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GivePage extends StatefulWidget {
  @override
  _GivePageState createState() => _GivePageState();
}

class _GivePageState extends State<GivePage> {
  int frequencyIndex = 0;
  List<String> freqTitle = ["One-Time", "Weekly", "Montly"];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 16.0, top: 8),
            child: buildTitle(),
          ),
          buildInputField(),
          buildFrequncyCard(),
          SizedBox(height: 16),
          Center(
            child: Text("Enter a dollar amount to make a gift."),
          ),
          SizedBox(height: 16),
          Center(
            child: RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Give Now"),
              shape: StadiumBorder(),
            ),
          )
        ],
      ),
    );
  }

  buildFrequncyCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
              (index) => ChoiceChip(
                label: Text(freqTitle[index]),
                selected: frequencyIndex == index,
                onSelected: (v) {
                  if (v) {
                    print("true");
                    setState(() {
                      frequencyIndex = index;
                    });
                  } else {
                    print("false");
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildInputField() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "\$",
              style: TextStyle(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.grey, fontSize: 72),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "0",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 72),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Image.asset(
          "images/img1.jpg",
          width: 50,
          height: 50,
        ),
        SizedBox(width: 8),
        Flexible(
            flex: 1,
            child: Text(
              "The Church Name is Here",
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            )),
        SizedBox(width: 8),
        IconButton(icon: Icon(CupertinoIcons.person_solid), onPressed: () {}),
      ],
    );
  }
}
