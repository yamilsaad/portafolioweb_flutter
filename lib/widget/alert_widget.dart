import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertMe extends StatelessWidget {
  const AlertMe({super.key});

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
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'contact Me',
                    style: TextStyle(color: Colors.green),
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
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              //style: ElevatedButton.styleFrom(
              //    primary: Colors.indigo,
              //    shape: const StadiumBorder(),
              //    elevation: 0),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  'Mostrar Alerta',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              //onPressed: () => displayDialogAndroid(context)
              onPressed: () => Platform.supportsSimd
                  ? displayDialogAndroid(context)
                  : displayDialogIOS(context))),
    );
  }
}
