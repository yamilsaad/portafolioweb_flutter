import 'package:flutter/material.dart';

class PosCatScreen extends StatelessWidget {
  const PosCatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo_poscat.jpg'),
            fit: BoxFit.cover)
        ),
        child: Row(
          children: [
            Container(
              color: Colors.grey,
              child: Text('Aquí va texto',),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}