import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MInput extends StatefulWidget {
  const MInput({Key? key}) : super(key: key);

  @override
  _MInputState createState() => _MInputState();
}

class _MInputState extends State<MInput> {
  String _username = '';

  // String _controllerText = '';

  TextEditingController? _controller;

  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    // ..addListener(() {
    // setState(() {
    //   _controllerText = _controller?.text ?? '';
    // });
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
    _focusNode?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300.0,
        child: Column(
          children: [
            TextField(
              focusNode: _focusNode,
              controller: _controller,
              onChanged: (String val) {
                setState(() {
                  _username = val;
                });
              },
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "姓名",
                hintText: "请输入姓名",
                helperText: "用户名长度不能超过10个",
                helperStyle:
                    const TextStyle(fontSize: 12.0, color: Colors.blue),
                helperMaxLines: 1,
                prefixIcon: const Icon(Icons.person),
                errorText: null,
                errorStyle: const TextStyle(fontSize: 12.0, color: Colors.red),
                counterText: "${_username.length}/10",
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
            ),
            Text(_username),
            Text(_controller?.text ?? ''),
            ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                child: const Text("聚焦")),
            ElevatedButton(
                onPressed: () {
                  _focusNode?.unfocus();
                },
                child: const Text("失焦")),
            TextField(
              obscureText: true,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp("[a-zA-Z]"), allow: true)
              ],
              decoration: const InputDecoration(
                labelText: "密码",
              ),
            )
          ],
        ),
      ),
    );
  }
}
