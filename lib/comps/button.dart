import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MButton extends StatefulWidget {
  const MButton({Key? key}) : super(key: key);

  @override
  _MButtonState createState() => _MButtonState();
}

class _MButtonState extends State<MButton> {
  double leng = 1;

  String? val;

  String selectVal = "Math";

  Widget getDropDown() {
    return DropdownButton(
        isExpanded: true,
        hint: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            "请选择",
            style: TextStyle(
                color: Colors.black12,
                backgroundColor: Colors.orange.withOpacity(0.4)),
          ),
        ),
        underline: Container(
          height: 4.0,
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0))),
        ),
        iconDisabledColor: Colors.red,
        onChanged: (String? msg) {
          setState(() {
            val = msg;
          });
        },
        value: val,
        items: const [
          DropdownMenuItem(
            child: Text("Flutter"),
            value: "f",
          ),
          DropdownMenuItem(
            child: Text("Javascript"),
            value: "js",
          ),
          DropdownMenuItem(
            child: Text("Java"),
            value: "java",
          )
        ]);
  }

  void setTimer() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        leng = 10;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20.0,
      children: [
        TextButton(
            onPressed: () {
              Fluttertoast.showToast(msg: "点击了TextBUtton");
            },
            child: const Text("TextButton")),
        TextButton(
            onPressed: () {
              Fluttertoast.showToast(msg: "点击了TextBUtton");
            },
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 18.0,
                    backgroundColor: Colors.black38,
                    color: Colors.red)),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.orange;
                  } else {
                    return Colors.pink;
                  }
                }),
                foregroundColor: MaterialStateProperty.all(Colors.green)),
            child: const Text("TextButton style")),
        ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(msg: "点击了ElevatedButton");
            },
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(20.0),
                minimumSize: MaterialStateProperty.all(const Size(150.0, 50.0)),
                // side: MaterialStateProperty.all(
                //     const BorderSide(color: Colors.orange, width: 3.0)),
                shadowColor: MaterialStateProperty.all(Colors.red),
                animationDuration: const Duration(seconds: 3),
                shape: MaterialStateProperty.all(StadiumBorder(
                    side: BorderSide(color: Colors.orange, width: leng))),
                overlayColor: MaterialStateProperty.all(Colors.pink)),
            child: const Text("ElevatedButton")),
        OutlinedButton(
          child: const Text("OutlinedButton"),
          onPressed: () {},
          autofocus: true,
        ),
        SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "点击了IconButton");
                  },
                  color: Colors.green,
                  splashColor: Colors.blue,
                  // hoverColor: Colors.orange,
                  highlightColor: Colors.orange.withOpacity(0.5),
                  // tooltip: "z这是icon的tooltip",
                  splashRadius: 20.0,
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.topLeft,
                  constraints:
                      const BoxConstraints(minWidth: 20.0, minHeight: 20.0),
                  iconSize: 20.0,
                  icon: const Icon(Icons.access_alarm)),
              const BackButton(
                color: Colors.green,
              ),
              const CloseButton(
                color: Colors.green,
              ),
            ],
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: 200.0,
              child: getDropDown(),
            ),
            Positioned(
                right: 20.0,
                top: 0,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  iconSize: 16.0,
                  onPressed: () {
                    setState(() {
                      val = null;
                    });
                  },
                ))
          ],
        ),
        PopupMenuButton(
            // child: const Text("选择"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            icon: const Icon(Icons.add_box),
            onSelected: (String str) {
              Fluttertoast.showToast(msg: str);
              setState(() {
                selectVal = str;
              });
            },
            initialValue: selectVal,
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  child: Text("语文"),
                  value: "Chinese",
                  textStyle: TextStyle(color: Colors.green),
                ),
                const PopupMenuItem<String>(
                  child: Text("数学"),
                  value: "Math",
                  enabled: false,
                  textStyle: TextStyle(color: Colors.orange),
                ),
                const PopupMenuItem<String>(
                  child: Text("英语"),
                  value: "English",
                  textStyle: TextStyle(color: Colors.orange),
                )
              ];
            }),
        // 可用于自定义 会继承开发设置的主题
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.green,
          textStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
          child: const Text("RawMaterialButton"),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          splashColor: Colors.orange,
          highlightColor: Colors.orange.withOpacity(0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        )
      ],
    );
  }
}
