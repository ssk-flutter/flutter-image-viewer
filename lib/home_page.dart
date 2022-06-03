import 'dart:ui';

import 'package:flutter/material.dart';

import 'repository/image_repository.dart';

import 'widget/timestamp_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImageRepository _repository = ImageRepository();

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
                  _repository.images.first.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              left: 18,
              bottom: 18,
              child: TimestampWidget(timestamp: _repository.images.first.time),
            ),
          ],
        ));
  }
}
