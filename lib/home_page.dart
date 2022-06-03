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
  int index = 0;

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
                  _repository.images[index].image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          index -= 1;
                          if (index < 0) {
                            index = 0;
                          }
                        });

                        print('index is $index');
                      },
                      icon: Icon(Icons.keyboard_arrow_left)),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          index += 1;
                          if (_repository.images.length <= index) {
                            index = _repository.images.length - 1;
                          }
                        });

                        print('index is $index');
                      },
                      icon: Icon(Icons.keyboard_arrow_right)),
                ],
              ),
            ),
            Positioned(
              left: 18,
              bottom: 18,
              child: TimestampWidget(timestamp: _repository.images[index].time),
            ),
          ],
        ));
  }
}
