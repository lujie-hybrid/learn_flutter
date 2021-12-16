import 'package:flutter/material.dart';

class MText extends StatelessWidget {
  const MText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250.0,
          height: 80.0,
          padding: const EdgeInsets.all(10.0),
          color: Colors.blueAccent,
          child: const Text(
            "Text文本用于展ABCDFGH示的DFGHFGHext文DFGHGH展示DFGH文本用于展示的数据",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.green, fontSize: 18.0),
          ),
        )
      ],
    );
  }
}
