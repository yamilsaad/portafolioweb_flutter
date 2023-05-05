import 'dart:io';

import 'package:flutter/material.dart';
import 'package:background_app_bar/background_app_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../screens/screen.dart';

class ResponsiveMobile extends StatefulWidget {
  const ResponsiveMobile({Key? key});

  @override
  _ResponsiveMobileState createState() => _ResponsiveMobileState();
}

class _ResponsiveMobileState extends State<ResponsiveMobile> {
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
        color: Colors.white60, fontSize: 18, fontWeight: FontWeight.bold);

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
                                    fontSize: 20),
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
                                        fontSize: 18),
                                  ),
                                  SizedBox(height: 25),
                                  CircleAvatar(
                                    radius: 70,
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
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PosCatScreen())),
                    child: Text(
                      'my Work',
                      style: _fontstyle,
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.white10),
                    ),
                  ),
                  SizedBox(
                    width: 20,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 50,
                    height: 200,
                  ),
                  Text(
                    'Hello!',
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(
                    width: 50,
                    height: 200,
                  ),
                  DefaultTextStyle(
                      style:
                          const TextStyle(fontSize: 40.0, color: Colors.white),
                      child:
                          AnimatedTextKit(repeatForever: true, animatedTexts: [
                        RotateAnimatedText('I am Yamil...'),
                        RotateAnimatedText('Flutter Developer'),
                        RotateAnimatedText('and'),
                        RotateAnimatedText('I can'),
                        RotateAnimatedText('Help you!'),
                      ]))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
