import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class MImage extends StatelessWidget {
  const MImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("图片的使用"),
      ),
      body: ListView(
        children: [
          Wrap(
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://img2.baidu.com/it/u=3246628741,3439955235&fm=26&fmt=auto"),
                        fit: BoxFit.cover)),
              ),
              ClipOval(
                child: Image.asset(
                  "images/1.png",
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              ClipOval(
                child: Image.asset(
                  "images/2.png",
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              Image.network(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg",
                width: 200.0,
                height: 200.0,
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool loaded) {
                  if (loaded) {
                    return child;
                  }
                  if (frame == null) {
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                  }
                  return AnimatedOpacity(
                    child: child,
                    opacity: 1,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
          Column(
            children: [
              Image.network(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg",
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  double d = loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1);
                  return CircularProgressIndicator(
                    value: d,
                  );
                },
              ),
              Container(
                width: 160.0,
                constraints: const BoxConstraints(minHeight: 185.0),
                padding: const EdgeInsets.only(
                    left: 8, top: 8, right: 20, bottom: 8),
                child: const Text(
                  "气泡图的应用气泡图的应用气的应用",
                  style: TextStyle(fontSize: 40.0),
                ),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        // fit: BoxFit.fill,
                        centerSlice: Rect.fromLTWH(20, 20, 1, 145),
                        image: NetworkImage(
                            "http://img.laomengit.com/20200623215201.png"))),
              ),
              OutlinedButton(onPressed: _getFile, child: const Text("点击"))
            ],
          ),
        ],
      ),
    );
  }

  _getFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path ?? '')).toList();
      print(files);
    } else {
      // User canceled the picker
    }
  }
}
