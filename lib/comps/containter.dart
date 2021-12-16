import 'package:flutter/material.dart';

class MContainer extends StatelessWidget {
  final Widget? child;
  const MContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 200.0,
      margin: const EdgeInsets.all(15.0),
      child: child ??
          const Text(
            "Container的使用",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline),
          ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.redAccent),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
