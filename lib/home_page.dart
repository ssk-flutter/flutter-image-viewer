import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final images = [
    "https://i.picsum.photos/id/930/200/300.jpg?hmac=mVMk8tDbj7-Utfz1VfwDV9UYCVrv9H0ktf0m1C0iBek",
    "https://i.picsum.photos/id/1021/300/200.jpg?hmac=Uwq-p1xg_lU331olJw79oBVMPMWXSnwp5E9SsFgF87g",
    "https://i.picsum.photos/id/494/100/300.jpg?hmac=MrRNlDX-Ve-g9dAiEsJkOw6RMHDUiUuvZ4DX0iDmN70",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('플코칭 Image Viewer'),
        ),
        body: Stack(
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Image.network(
                  images[2],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              left: 18,
              bottom: 18,
              child: Text(
                'timestamp here',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white, shadows: [
                  Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 8.0,
                      color: Colors.black.withAlpha(125)),
                ]),
              ),
            ),
          ],
        ));
  }
}
