import 'package:flutter/material.dart';
import 'package:kld/pages/image.dart';
import 'package:kld/pages/common.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("首页"),
        ),
        body: const HomeContent(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      routes: {
        "common": (context) => const MCommon(),
        "image": (context) => const MImage()
      },
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getList(context),
    );
  }

  // 列表数据
  List<Widget> getList(context) {
    List<String> titles = ["common", "image"];
    return titles
        .map((t) => Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                title: Text(
                  t,
                  style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                ),
                leading: Image.network(
                  "https://img0.baidu.com/it/u=1303636189,2885099528&fm=26&fmt=auto",
                  // width: 60.0,
                  // height: 60.0,
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.noRepeat,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(t);
                },
              ),
            ))
        .toList();
  }
}
