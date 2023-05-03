import 'dart:html';

import 'package:flutter/material.dart';
import 'package:background_app_bar/background_app_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveTablet extends StatefulWidget {
  const ResponsiveTablet({super.key});

  @override
  State<ResponsiveTablet> createState() => _ResponsiveTabletState();
}

class _ResponsiveTabletState extends State<ResponsiveTablet> {
  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              'me',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'I am a constantly growing Flutter Developer. I lead a quiet life, I like to be in contact with nature and I love technology. I love giving technological solutions and advice to improve the quality of life and the quality of products and services. If you want me to help you, don´t hesitate to contact me!',
                  style: TextStyle(color: Colors.white60),
                ),
                SizedBox(height: 10),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'oK',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'contact Me',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible:
            false, //es para salir de un cuadro sin boton haciendo click afuera del cuadro
        context: context,
        builder: ((context) {
          return AlertDialog(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text(
              'me',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                    'I am a constantly growing Flutter Developer. I lead a quiet life, I like to be in contact with nature and I love technology. I love giving technological solutions and advice to improve the quality of life and the quality of products and services. If you want me to help you, don´t hesitate to contact me!',
                    style: TextStyle(color: Colors.white60)),
                SizedBox(height: 10),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('OK')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'contact Me',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          );
        }));
  }

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/fondo_techAnimation.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
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
        color: Colors.white60, fontSize: 20, fontWeight: FontWeight.bold);

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
                      onPressed: () => Platform.supportsSimd
                          ? displayDialogAndroid(context)
                          : displayDialogIOS(context),
                      child: Text(
                        'me',
                        style: _fontstyle,
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'my work',
                        style: _fontstyle,
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'contact',
                        style: _fontstyle,
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
