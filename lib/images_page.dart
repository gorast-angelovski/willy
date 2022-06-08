import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_page.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ImagesPage> createState() => _MyImagesState();
}

class _MyImagesState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  'Images',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Divider(
                    color: Colors.black,
                    height: 2,
                  ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20, left: 60, right: 60),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  // Column(children:
                  // [ElevatedButton(onPressed:() {return;}, child: const Text("Go back")),],),
                          Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    await availableCameras().then((value) => Navigator.push(context,
                                      MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
                                  },
                                  child: const Text("Add image"))
                            ],
                          ),
                        ],
                      ),
                  ),
              ),
            ],
          ),
      ),
    );
  }
}
