import 'dart:math' as m;
import 'package:church/functiions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:volume/volume.dart';

class AudioPlayerPage extends StatefulWidget {
  var playerState = FlutterRadioPlayer.flutter_radio_loading;

  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();
  int maxVol, currentVol;
  AudioManager audioManager;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int playerSpeed = 2;

  var sliderValue = .5;

  @override
  void initState() {
    super.initState();
    audioManager = AudioManager.STREAM_MUSIC;
    initRadioService();
    initAudioStreamType();
    updateVolumes();
  }

  initAudioStreamType() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  updateVolumes() async {
    maxVol = await Volume.getMaxVol;
    currentVol = await Volume.getVol;
    setState(() {});
  }
 
  setVolume(int i) async {
    await Volume.setVol(i, showVolumeUI: ShowVolumeUI.HIDE);
  }

  Future<void> initRadioService() async {
    try {
      await _flutterRadioPlayer.init(
        "Church",
        "HOPE FOR TOMMOROW",
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
        "true",
      );
    } on PlatformException {
      print("Exception occured while trying to register the services.");
    }
  }

  Widget currentIcon() {
    return StreamBuilder(
      stream: _flutterRadioPlayer.isPlayingStream,
      initialData: widget.playerState,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        String returnData = snapshot.data;
        print("object data: " + returnData);
        switch (returnData) {
          case FlutterRadioPlayer.flutter_radio_stopped:
            return InkWell(
                child: Icon(Icons.radio),
                onTap: () async {
                  await initRadioService();
                });
            break;
          case FlutterRadioPlayer.flutter_radio_loading:
            return Center(child: CircularProgressIndicator());
          case FlutterRadioPlayer.flutter_radio_error:
            return IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  await initRadioService();
                });
            break;
          default:
            return snapshot.data != FlutterRadioPlayer.flutter_radio_playing
                ? InkWell(
                    onTap: () async {
                      print("button press data: " + snapshot.data.toString());
                      await _flutterRadioPlayer.play();
                    },
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 64,
                    ))
                : InkWell(
                    onTap: () async {
                      await _flutterRadioPlayer.pause();
                    },
                    child: Icon(
                      Icons.pause,
                      size: 64,
                      color: Colors.white,
                    ),
                  );
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      backgroundColor: Colors.orangeAccent.withOpacity(.8),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                children: <Widget>[
                  Slider.adaptive(
                    min: 0,
                    max: 100,
                    value: sliderValue,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey.withOpacity(0.7),
                    onChanged: (v) {
                      setState(() {
                        sliderValue = v;
                      });
                    },
                  ),
                  buildMediaIcons(),
                ],
              ),
            ),
            Align(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .75,
                child: AspectRatio(
                  aspectRatio: 1,
                                  child: Image.asset(
                    "images/img1.jpg",
                    // fit: BoxFit.fill,
                    
                  ),
                ),
              ),
            ),

            Positioned(
              top: 16,
              left: 24,
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Transform.rotate(
                  angle: m.pi / -2,
                  child: Icon(CupertinoIcons.back, color: Colors.white))),),
          ],
        ),
      ),
    );
  }

  Widget buildMediaIcons() {
    return Row(
      // direction: Axis.horizontal,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Text(
            "${playerSpeed}X",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Spacer(),
        IconButton(
          splashColor: Colors.white,
          icon: Icon(
            Icons.replay_10,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        horizontalSpace(),
        currentIcon(),
        horizontalSpace(),
        IconButton(
          splashColor: Colors.white,
          icon: Icon(
            Icons.replay_10,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Spacer(),
        InkWell(
          splashColor: Colors.white,
          child: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onTap: () {
            showSnack();
          },
        ),
      ],
    );
  }

  showSnack() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.black,
              ),
              title: Text(
                "Share",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_downward,
                color: Colors.black,
              ),
              title: Text(
                "Download",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
