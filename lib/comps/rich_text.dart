import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MRichText extends StatelessWidget {
  const MRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <InlineSpan>[
          const TextSpan(text: "这是个默认文本"),
          WidgetSpan(
              child: Column(
            children: const [Text("666"), Text("888")],
          )),
          TextSpan(
              text: "这是个第二个文本",
              style:
                  TextStyle(fontSize: 20.0, color: Colors.red.withOpacity(.2))),
          TextSpan(
              text: "可点击的文本",
              style: const TextStyle(fontSize: 24.0, color: Colors.green),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Fluttertoast.showToast(
                      msg: "点击了文字",
                      fontSize: 18.0,
                      gravity: ToastGravity.CENTER,
                      textColor: Colors.white54,
                      backgroundColor: Colors.green);
                })
        ]));
  }
}
