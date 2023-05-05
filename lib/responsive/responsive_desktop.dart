import 'dart:io';

import 'package:flutter/material.dart';
import 'package:background_app_bar/background_app_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../screens/screen.dart';

class ResponsiveDesktop extends StatefulWidget {
  const ResponsiveDesktop({super.key});

  @override
  State<ResponsiveDesktop> createState() => _ResponsiveDesktopState();
}

class _ResponsiveDesktopState extends State<ResponsiveDesktop> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/fondoProfile.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _fontstyle = TextStyle(
        color: Colors.white60, fontSize: 25, fontWeight: FontWeight.bold);

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FadeTransition(
                            opacity: CurvedAnimation(
                              parent: ModalRoute.of(context)!.animation!,
                              curve: Curves.easeOut,
                            ),
                            child: AlertDialog(
                              title: Text(
                                "Hello!",
                                style: TextStyle(
                                    fontFamily: 'Dancing Script',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 16),
                                  Text(
                                    "I'm a Flutter Developer. I love being in contact with nature, giving solutions and I love technology!",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  SizedBox(height: 25),
                                  CircleAvatar(
                                    radius: 90,
                                    backgroundImage: NetworkImage(
                                      "assets/images/avatar_perfil.jpg",
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text("Talk me"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5.0,
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'me',
                      style: _fontstyle,
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white10),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PosCatScreen())),
                    child: Text(
                      'my work',
                      style: _fontstyle,
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white10),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PosCatScreen())),
                    child: Text(
                      'contact',
                      style: _fontstyle,
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white10),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                //alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 450,
                      height: 70,
                    ),
                    DefaultTextStyle(
                        style:
                            const TextStyle(fontSize: 90.0, color: Colors.red),
                        child: AnimatedTextKit(animatedTexts: [
                          FadeAnimatedText('Hello',
                              textStyle: TextStyle(
                                  fontFamily: 'Staatliches',
                                  color: Colors.yellow.shade800)),
                          RotateAnimatedText('I am Yamil...',
                              textStyle: TextStyle(fontFamily: 'Staatliches')),
                          FadeAnimatedText('Flutter Developer',
                              textStyle: TextStyle(
                                  fontFamily: 'Staatliches',
                                  color: Colors.red)),
                          RotateAnimatedText('and',
                              textStyle: TextStyle(fontFamily: 'Staatliches')),
                          FadeAnimatedText('I can Help you!',
                              textStyle: TextStyle(
                                  fontFamily: 'Staatliches',
                                  color: Colors.yellow.shade800)),
                        ])),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
