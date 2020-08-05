import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: TheStart(),
  ));
}

class TheStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('CLICK ME AND CHECKOUT THE AUDIOS AND VIDEOS'),
          color: Colors.grey,
          elevation: 25,
          highlightColor: Colors.pink,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstRoute()),
            );
          },
        ),
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('AUDIO & VIDEO PLAYER'),
      ),
      body: Center(
        child: Container(
          width: 800,
          height: 100,
          color: Colors.black,
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                    elevation: 30,
                    color: Colors.grey,
                    splashColor: Colors.white,
                    child: Text(
                      'AUDIO',
                    ),
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    }),
                RaisedButton(
                    elevation: 30,
                    color: Colors.red,
                    splashColor: Colors.white,
                    child: Text('VIDEO'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute2()),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  static AudioPlayer newPlayer = new AudioPlayer();
  AudioCache audio = new AudioCache(fixedPlayer: newPlayer);
  bool play = false;
  bool stop = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swap & Listen'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 1000,
              width: 1000,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    color: Colors.black,
                    //Audio1-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/sukhkarta.PNG'),
                                        ListTile(
                                          title:
                                              Text('SONG: SUKHKARTA DUKHHARTA'),
                                          subtitle:
                                              Text('ARTIST: LATA MANGESHKAR'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('sukhkarta.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ), //Audio-1-box
                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/tellme.PNG'),
                                        ListTile(
                                          title: Text(
                                              "SONG: TELL ME SOMETHING I DON'T KNOW"),
                                          subtitle: Text('SELENA GOMEZ'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('tellme.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/rockabye.PNG'),
                                        ListTile(
                                          title: Text('SONG: ROCKABYE'),
                                          subtitle:
                                              Text('ARTIST: CLEAN BANDIT'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('rockabye.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/cheapthrills.PNG'),
                                        ListTile(
                                          title: Text('SONG: CHEAP THRILLS'),
                                          subtitle: Text('ARTIST: SIA'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('cheapthrills.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/memories.PNG'),
                                        ListTile(
                                          title: Text('SONG: MEMORIES'),
                                          subtitle: Text('ARTIST: MAROON 5'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play(
                                                    'Maroon 5 - Memories.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset(
                                            'images/friend_ganesha.PNG'),
                                        ListTile(
                                          title:
                                              Text('SONG: O MY FRIEND GANESHA'),
                                          subtitle:
                                              Text('ARTIST: SHRAVAN SURESH'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio
                                                    .play('friend_ganesha.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/lalala.PNG'),
                                        ListTile(
                                          title: Text('SONG: LALALAA'),
                                          subtitle: Text('ARTIST: SHAKIRA'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('lalala.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/ignite.PNG'),
                                        ListTile(
                                          title: Text('SONG: IGNITE'),
                                          subtitle: Text('ARTIST: ALAN WALKER'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('ignite.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/jaiho.PNG'),
                                        ListTile(
                                          title: Text('SONG: JAI HO'),
                                          subtitle: Text('ARTIST: AR REHMAN'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('jaiho.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/rockyou.PNG'),
                                        ListTile(
                                          title: Text('SONG: WE WILL ROCK YOU'),
                                          subtitle: Text('ARTIST: QUEEN'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('rockyou.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/desrangila.PNG'),
                                        ListTile(
                                          title: Text('SONG: DES RANGILA'),
                                          subtitle:
                                              Text('ARTIST: MAHALAKSHMI IYER'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('desrangila.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/waka.PNG'),
                                        ListTile(
                                          title: Text('SONG: WAKA WAKA'),
                                          subtitle: Text('ARTIST: SHAKIRA'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('waka.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/nokia.PNG'),
                                        ListTile(
                                          title: Text('AUDIO: NOKIA TUNE'),
                                          subtitle:
                                              Text('ARTIST: GRANDE VALSE'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('Nokia.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    //Audio2-box
                    width: 250,
                    height: 400,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            color: Colors.blue,
                            //container containing 2 containers
                            width: 200,
                            height: 475,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Container(
                                  //1-image-container
                                  width: 10.0,
                                  // height: 500.0,
                                  child: Card(
                                    child: Wrap(
                                      children: <Widget>[
                                        Image.asset('images/believer.PNG'),
                                        ListTile(
                                          title: Text('SONG: BELIEVER'),
                                          subtitle:
                                              Text('ARTIST: IMAGINE DRAGONS'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  //Icon-buttons container with row containing buttons
                                  width: 1000,
                                  height: 50,
                                  //width: MediaQuery.of(context).size.width * 0.8,
                                  //height: 80,
                                  // margin: EdgeInsets.all(0.0),
                                  // top: MediaQuery.of(context).size.height *
                                  //    0.7,
                                  //left: MediaQuery.of(context).size.width *
                                  //  0.10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.white),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              if (play == false ||
                                                  stop == true) {
                                                audio.play('believer.mp3');
                                                play = true;
                                                stop = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.pause),
                                            onPressed: () {
                                              if (play == true) {
                                                newPlayer.pause();
                                                play = false;
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Ink(
                                          decoration: const ShapeDecoration(
                                            shape: CircleBorder(),
                                            color: Colors.white,
                                          ),
                                          child: IconButton(
                                            padding: new EdgeInsets.all(0.0),
                                            iconSize: 25,
                                            highlightColor: Colors.black,
                                            icon: Icon(Icons.stop),
                                            onPressed: () {
                                              if (play == true &&
                                                  stop == false) {
                                                newPlayer.stop();
                                                play = false;
                                                stop = true;
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ), //hint
                ],
              ),
            ), //FIRST AUDIO
          ],
        ),
      ),
    );
  }
}

class SecondRoute2 extends StatefulWidget {
  @override
  _SecondRoute2State createState() => _SecondRoute2State();
}

class _SecondRoute2State extends State<SecondRoute2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("CLICK AND PLAY !!"),
        ),
        body: Center(
          child: Container(
            width: 500,
            height: 550,
            child: Stack(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 1000,
                    width: 1000,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 250,
                          height: 400,
                          child: RaisedButton(
                            elevation: 30,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Video1()),
                              );
                            },
                            child: Card(
                              child: Wrap(
                                children: <Widget>[
                                  Image.asset('images/blue.PNG'),
                                  ListTile(
                                    title: Text('Video : BLUE PARTILE MOTION'),
                                    subtitle:
                                        Text('DOWNLODED FROM SITE: videvo.net'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 400,
                          child: RaisedButton(
                            elevation: 30,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Video2()),
                              );
                            },
                            child: Card(
                              child: Wrap(
                                children: <Widget>[
                                  Image.asset('images/earth.PNG'),
                                  ListTile(
                                    title: Text('Video : Earth_Zoom_In '),
                                    subtitle:
                                        Text('DOWNLODED FROM SITE: videvo.net'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 400,
                          child: RaisedButton(
                            elevation: 30,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Video3()),
                              );
                            },
                            child: Card(
                              child: Wrap(
                                children: <Widget>[
                                  Image.asset('images/galaxy.PNG'),
                                  ListTile(
                                    title: Text(
                                        'Video : Galaxy_With_Customization '),
                                    subtitle:
                                        Text('DOWNLODED FROM SITE: videvo.net'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 400,
                          child: RaisedButton(
                            elevation: 30,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Video4()),
                              );
                            },
                            child: Card(
                              child: Wrap(
                                children: <Widget>[
                                  Image.asset('images/storm.PNG'),
                                  ListTile(
                                    title: Text('Video : Sydney_storm'),
                                    subtitle:
                                        Text('DOWNLODED FROM SITE: videvo.net'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

class Video1 extends StatefulWidget {
  Video1() : super();
  final String title = "Video 1";
  @override
  _Video1State createState() => _Video1State();
}

class _Video1State extends State<Video1> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //_controller = VideoPlayerController.network("");
    _controller = VideoPlayerController.asset(
        "videos/Blue_Particle_Motion_Background_1080.mov");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video 1"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

class Video2 extends StatefulWidget {
  Video2() : super();
  final String title = "Video 2";
  @override
  _Video2State createState() => _Video2State();
}

class _Video2State extends State<Video2> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //_controller = VideoPlayerController.network("");
    _controller = VideoPlayerController.asset("videos/earth2.mov");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video 2"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

class Video3 extends StatefulWidget {
  Video3() : super();
  final String title = "Video3";
  @override
  _Video3State createState() => _Video3State();
}

class _Video3State extends State<Video3> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //_controller = VideoPlayerController.network("");
    _controller = VideoPlayerController.asset("videos/galaxy3.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video 3"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

class Video4 extends StatefulWidget {
  Video4() : super();
  final String title = "Video4";
  @override
  _Video4State createState() => _Video4State();
}

class _Video4State extends State<Video4> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //_controller = VideoPlayerController.network("");
    _controller = VideoPlayerController.asset("videos/storm4.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video 4"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
